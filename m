Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViAvl-0006uC-K4
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2013 22:35:02 +0000
Received: by mail-wg0-f45.google.com with SMTP id a1so5506288wgh.0
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2013 14:34:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384724403.2727.22.camel@joe-AO722>
References: <1384719513-27386-1-git-send-email-nunes.erico@gmail.com>
 <1384724403.2727.22.camel@joe-AO722>
Date: Sun, 17 Nov 2013 20:34:37 -0200
Message-ID: <CAK4VdL2nKEE+xb=HtMGNsMGNR_ivUn_WnLi7X-rrXT0fpGbSTw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix sparse errors: directive in argument list
From: Erico Nunes <nunes.erico@gmail.com>
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-sparse@vger.kernel.org,
 dwmw2 <dwmw2@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your reply.

I'll resubmit shortly.

Do you mean it as an error in the sparse tool?
I don't think so, I took a look and it seems to be designed to output
an error for that case.


On Sun, Nov 17, 2013 at 7:40 PM, Joe Perches <joe@perches.com> wrote:
> On Sun, 2013-11-17 at 18:18 -0200, Erico Nunes wrote:
>> This patch fixes the following errors reported when running sparse:
>> fs/jffs2/super.c:378:1: error: directive in argument list
>> fs/jffs2/super.c:380:1: error: directive in argument list
>> fs/jffs2/super.c:381:1: error: directive in argument list
>> fs/jffs2/super.c:383:1: error: directive in argument list
>
> Seems like a sparse error more than anything else.
> (adding sparse mailing list)
>
> Also you need to add a "Signed-off-by:" line
> with your email address.
>
> see: Documentation/SubmittingPatches
>
>> ---
>>  fs/jffs2/super.c | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
>> index 0defb1c..ec9e16f 100644
>> --- a/fs/jffs2/super.c
>> +++ b/fs/jffs2/super.c
>> @@ -361,6 +361,14 @@ MODULE_ALIAS_FS("jffs2");
>>  static int __init init_jffs2_fs(void)
>>  {
>>       int ret;
>> +     const char desc[] =3D "version 2.2."
>> +#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>> +             " (NAND)"
>> +#endif
>> +#ifdef CONFIG_JFFS2_SUMMARY
>> +             " (SUMMARY) "
>> +#endif
>> +             " =A9 2001-2006 Red Hat, Inc.";
>>
>>       /* Paranoia checks for on-medium structures. If we ask GCC
>>          to pack them with __attribute__((packed)) then it _also_
>> @@ -374,14 +382,7 @@ static int __init init_jffs2_fs(void)
>>       BUILD_BUG_ON(sizeof(struct jffs2_raw_inode) !=3D 68);
>>       BUILD_BUG_ON(sizeof(struct jffs2_raw_summary) !=3D 32);
>>
>> -     pr_info("version 2.2."
>> -#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>> -            " (NAND)"
>> -#endif
>> -#ifdef CONFIG_JFFS2_SUMMARY
>> -            " (SUMMARY) "
>> -#endif
>> -            " =A9 2001-2006 Red Hat, Inc.\n");
>> +     pr_info("%s\n", desc);
>>
>>       jffs2_inode_cachep =3D kmem_cache_create("jffs2_i",
>>                                            sizeof(struct jffs2_inode_inf=
o),
>
>
>
