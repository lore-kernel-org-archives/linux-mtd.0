Received: from mail.grid-net.com ([97.65.115.2])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OthPl-000227-A2
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 13:43:47 +0000
References: <1283933928-14601-1-git-send-email-dedekind1@gmail.com>
	<C7A5B00EFC707A46AB67997D0215216786812A@mx1.grid-net.com>
	<AANLkTimOCyLXdHM0sJ-ObVgS3S9PFtYomorJhWpE+gB-@mail.gmail.com>
Message-ID: <6CBB27E8-B22A-41C6-B397-8C5FB2437716@grid-net.com>
From: "Steve Iribarne" <siribarne@grid-net.com>
To: "Arno Steffen" <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTimOCyLXdHM0sJ-ObVgS3S9PFtYomorJhWpE+gB-@mail.gmail.com>
Content-Type: text/plain;
	format=flowed;
	delsp=yes;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0 (iPhone Mail 7E18)
Subject: Re: [PATCHv2] mkfs.ubifs: do not override root inode permissions
Date: Thu, 9 Sep 2010 06:43:29 -0700
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes.  We follow the latest changes.  Mainly because I'm going to start  
implementing ubifs and SELinux.  So I want to have the latest and  
greatest when I do it.

-stv
On Sep 9, 2010, at 5:32, "Arno Steffen" <arno.steffen@googlemail.com>  
wrote:

> Does someone of you is expert enough to patch mkfs.jffs2?
>
> 2010/9/8 Steve Iribarne <siribarne@grid-net.com>:
>>
>> Sorry for the top post... stupid M$oft outlook.
>>
>> Anyway.. .just a quick thanks for v2 of this from someone who uses  
>> this in
>> production.
>> I can eventually migrate to the proper option but it's going to  
>> take me two
>> releases to do it.
>>
>> -stv
>>
>> -----Original Message-----
>> From: linux-mtd-bounces@lists.infradead.org on behalf of Artem  
>> Bityutskiy
>> Sent: Wed 9/8/2010 1:18 AM
>> To: linux-mtd@lists.infradead.org
>> Cc: Arno Steffen; Adrian Hunter
>> Subject: [PATCHv2] mkfs.ubifs: do not override root inode permissions
>>
>> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>>
>> When mkfs.ubifs is used with -r dir, it does not make the root UBIFS
>> inode uid/gid/permissions to be equivalent to dir's permissions, but
>> it makes root inode permissions to be equivalent to uid = git = 0
>> (root) and permissions = u+rwx go+rx.
>>
>> Unfortunately, we cannot simply fix this bug, because mkfs.ubifs is
>> already used in production. Thus, we have introduce --squash-rino- 
>> perm
>> option which is the default and it preserves the old mkfs.ubifs
>> behavior. We also introduce --nosquash-rino-perm option which fixes
>> mkfs.ubifs behavior. If none of these options is used, we print a
>> warning. The plan is to make everyone use one of these options, then
>> make --nosquash-rino-perm to be the default and remove the warning,
>> and then eventually deprecate and remove both options.
>>
>> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> ---
>>  mkfs.ubifs/mkfs.ubifs.c |   87
>> ++++++++++++++++++++++++++++++++++------------
>>  1 files changed, 64 insertions(+), 23 deletions(-)
>>
>> diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
>> index 9f2a226..eeb5e42 100644
>> --- a/mkfs.ubifs/mkfs.ubifs.c
>> +++ b/mkfs.ubifs/mkfs.ubifs.c
>> @@ -23,7 +23,7 @@
>>  #include "mkfs.ubifs.h"
>>  #include <crc32.h>
>>
>> -#define PROGRAM_VERSION "1.3"
>> +#define PROGRAM_VERSION "1.4"
>>
>>  /* Size (prime number) of hash table for link counting */
>>  #define HASH_TABLE_SIZE 10099
>> @@ -109,6 +109,7 @@ static char *output;
>>  static int out_fd;
>>  static int out_ubi;
>>  static int squash_owner;
>> +static int squash_rino_perm = -1;
>>
>>  /* The 'head' (position) which nodes are written */
>>  static int head_lnum;
>> @@ -134,25 +135,27 @@ static unsigned long long creat_sqnum;
>>  static const char *optstring = "d:r:m:o:D:h? 
>> vVe:c:g:f:P:k:x:X:j:R:l:j:U";
>>
>>  static const struct option longopts[] = {
>> -       {"root",          1, NULL, 'r'},
>> -       {"min-io-size",   1, NULL, 'm'},
>> -       {"leb-size",      1, NULL, 'e'},
>> -       {"max-leb-cnt",   1, NULL, 'c'},
>> -       {"output",        1, NULL, 'o'},
>> -       {"devtable",      1, NULL, 'D'},
>> -       {"help",          0, NULL, 'h'},
>> -       {"verbose",       0, NULL, 'v'},
>> -       {"version",       0, NULL, 'V'},
>> -       {"debug-level",   1, NULL, 'g'},
>> -       {"jrn-size",      1, NULL, 'j'},
>> -       {"reserved",      1, NULL, 'R'},
>> -       {"compr",         1, NULL, 'x'},
>> -       {"favor-percent", 1, NULL, 'X'},
>> -       {"fanout",        1, NULL, 'f'},
>> -       {"keyhash",       1, NULL, 'k'},
>> -       {"log-lebs",      1, NULL, 'l'},
>> -       {"orph-lebs",     1, NULL, 'p'},
>> -       {"squash-uids" ,  0, NULL, 'U'},
>> +       {"root",               1, NULL, 'r'},
>> +       {"min-io-size",        1, NULL, 'm'},
>> +       {"leb-size",           1, NULL, 'e'},
>> +       {"max-leb-cnt",        1, NULL, 'c'},
>> +       {"output",             1, NULL, 'o'},
>> +       {"devtable",           1, NULL, 'D'},
>> +       {"help",               0, NULL, 'h'},
>> +       {"verbose",            0, NULL, 'v'},
>> +       {"version",            0, NULL, 'V'},
>> +       {"debug-level",        1, NULL, 'g'},
>> +       {"jrn-size",           1, NULL, 'j'},
>> +       {"reserved",           1, NULL, 'R'},
>> +       {"compr",              1, NULL, 'x'},
>> +       {"favor-percent",      1, NULL, 'X'},
>> +       {"fanout",             1, NULL, 'f'},
>> +       {"keyhash",            1, NULL, 'k'},
>> +       {"log-lebs",           1, NULL, 'l'},
>> +       {"orph-lebs",          1, NULL, 'p'},
>> +       {"squash-uids" ,       0, NULL, 'U'},
>> +       {"squash-rino-perm",   0, NULL, 'Q'},
>> +       {"nosquash-rino-perm", 0, NULL, 'q'},
>>         {NULL, 0, NULL, 0}
>>  };
>>
>> @@ -190,6 +193,12 @@ static const char *helptext =
>>  "-V, --version            display version information\n"
>>  "-g, --debug=LEVEL        display debug information (0 - none, 1 -
>> statistics,\n"
>>  "                         2 - files, 3 - more details)\n"
>> +"-Q, --squash-rino-perm   ignore permissions of the FS image  
>> directory (the
>> one\n"
>> +"                         specified with --root) and make the  
>> UBIFS root
>> inode\n"
>> +"                        permissions to be {uid=gid=root, u+rwx,go 
>> +rx};
>> this is\n"
>> +"                         see also the default so far, see  
>> explanations
>> below\n"
>> +"-q, --nosquash-rino-perm for the UBIFS root inode use permissions  
>> of the
>> FS\n"
>> +"                         image directory (the one specified with
>> --root)\n"
>>  "-h, --help               display this help text\n\n"
>>  "Note, SIZE is specified in bytes, but it may also be specified in
>> Kilobytes,\n"
>>  "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
>> @@ -201,7 +210,19 @@ static const char *helptext =
>>  "or more percent better than \"lzo\", mkfs.ubifs chooses \"lzo\",  
>> otherwise
>> it chooses\n"
>>  "\"zlib\". The \"--favor-percent\" may specify arbitrary threshold  
>> instead
>> of the\n"
>>  "default 20%.\n\n"
>> -"The -R parameter specifies amount of bytes reserved for the
>> super-user.\n";
>> +"The -R parameter specifies amount of bytes reserved for the
>> super-user.\n\n"
>> +"Some clarifications about --squash-rino-perm and --nosquash-rino- 
>> perm
>> options.\n"
>> +"Originally, mkfs.ubifs did not have them, and it always set  
>> permissions
>> for the UBIFS\n"
>> +"root inode to be {uid=gid=root, u+rwx,go+rx}. This was a bug  
>> which was
>> found too\n"
>> +"late, when mkfs.ubifs had already been used in production. To fix  
>> this
>> bug, 2 new\n"
>> +"options were introduced: --squash-rino-perm which preserves the old
>> behavior and\n"
>> +"--nosquash-rino-perm which makes mkfs.ubifs use the right  
>> permissions for
>> the root\n"
>> +"inode. For now --squash-rino-perm is the default, and if neither
>> --squash-rino-perm\n"
>> +"nor --nosquash-rino-perm are used, mkfs.ubifs prints a warning. The
>> further plan is:\n"
>> +" o keep the warning for few releases to make sure users start  
>> using one of
>> the\n"
>> +"   options\n"
>> +" o make --nosquash-rino-perm to be the default, and remove the  
>> warning\n"
>> +" o eventually deprecate both options\n";
>>
>>  /**
>>   * make_path - make a path name from a directory and a name.
>> @@ -643,6 +664,12 @@ static int get_options(int argc, char**argv)
>>                 case 'U':
>>                         squash_owner = 1;
>>                         break;
>> +               case 'Q':
>> +                       squash_rino_perm = 1;
>> +                       break;
>> +               case 'q':
>> +                       squash_rino_perm = 0;
>> +                       break;
>>                 }
>>         }
>>
>> @@ -671,6 +698,10 @@ static int get_options(int argc, char**argv)
>>                 return err_msg("Maximum count of LEBs was not  
>> specified "
>>                                "(use -h for help)");
>>
>> +       if (squash_rino_perm != -1 && root)
>> +               return err_msg("--squash-rino-perm and nosquash- 
>> rino-perm
>> options"
>> +                              "can be used only with the --root  
>> option");
>> +
>>         if (c->max_bud_bytes == -1) {
>>                 int lebs;
>>
>> @@ -1630,18 +1661,28 @@ static int add_multi_linked_files(void)
>>  static int write_data(void)
>>  {
>>         int err;
>> +       mode_t mode = S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP |  
>> S_IROTH |
>> S_IXOTH;
>>
>>         if (root) {
>>                 err = stat(root, &root_st);
>>                 if (err)
>>                         return sys_err_msg("bad root file-system  
>> directory
>> '%s'",
>>                                            root);
>> +               if (squash_rino_perm == -1) {
>> +                       printf("WARNING: setting root UBIFS inode  
>> UID=GID=0
>> (root) and permissions "
>> +                                "to u+rwx,go+rx; use --squash-rino- 
>> perm or
>> --nosquash-rino-perm "
>> +                                "to suppress this warning");
>> +                       squash_rino_perm = 1;
>> +               }
>> +               if (squash_rino_perm) {
>> +                       root_st.st_uid = root_st.st_gid = 0;
>> +                       root_st.st_mode = mode;
>> +               }
>>         } else {
>>                 root_st.st_mtime = time(NULL);
>>                 root_st.st_atime = root_st.st_ctime =  
>> root_st.st_mtime;
>> +               root_st.st_mode = mode;
>>         }
>> -       root_st.st_uid = root_st.st_gid = 0;
>> -       root_st.st_mode = S_IFDIR | S_IRWXU | S_IRGRP | S_IXGRP |  
>> S_IROTH |
>> S_IXOTH;
>>
>>         head_flags = 0;
>>         err = add_directory(root, UBIFS_ROOT_INO, &root_st, !root);
>> --
>> 1.7.1.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
