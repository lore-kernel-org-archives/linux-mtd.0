Received: from an-out-0708.google.com ([209.85.132.251])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqwJS-0006cE-9a
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 21:57:22 +0000
Received: by an-out-0708.google.com with SMTP id c38so731158ana.27
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Sep 2009 14:57:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090924141433.GC27905@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090924141433.GC27905@nb.net.home>
Date: Thu, 24 Sep 2009 23:57:14 +0200
Message-ID: <71cd59b00909241457p3b9247a1q661ea63bde584f26@mail.gmail.com>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind1@gmail.com, Karel Zak <kzak@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 24, 2009 at 4:14 PM, Karel Zak <kzak@redhat.com> wrote:
> On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
>> --- a/shlibs/blkid/src/devname.c
>> +static void
>> +ubi_probe_all(blkid_cache cache, int only_if_new)
>> +{
>> + =A0 =A0 const char **dirname;
>> +
>> + =A0 =A0 for (dirname =3D dirlist; *dirname; dirname++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 DBG(DEBUG_DEVNAME, printf("probing UBI volumes=
 under %s\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 *dirname));
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 DIR =A0 =A0 =A0 =A0 =A0 =A0 *dir;
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct dirent =A0 *iter;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 dir =3D opendir(*dirname);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (dir =3D=3D NULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue ;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 while ((iter =3D readdir(dir)) !=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char =A0 =A0 =A0 =A0 =A0 =A0*n=
ame, *device;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct stat =A0 =A0 st;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_t =A0 =A0 =A0 =A0 =A0 dev;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D iter->d_name;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strcmp(name, ".") || !str=
cmp(name, "..") ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !strstr(name, "ubi"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!strcmp(name, "ubi_ctrl"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device =3D malloc(strlen(*dirn=
ame) + strlen(name) + 2);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!device)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break ;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sprintf(device, "%s/%s", *dirn=
ame, name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (stat(device, &st))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break ;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(st.st_rdev & 0xFF)) { //=
 It's an UBI Device
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(device);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue ;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> Wouldn't be better to
>
> =A0#define is_ubi_device(s) =A0 =A0(S_ISCHR(s->st_mode) && (s->st_rdev & =
0xFF))
>
> (or major() instead magic 0xFF constant?) and use it everywhere in
> code? I guess UBI is always a char device.

Maybe something like that:
#define is_ubi_device(s)    (S_ISCHR(s->st_mode) && !minor(s->st_rdev))

>> +++ b/shlibs/blkid/src/probe.c
>> @@ -284,6 +284,8 @@ int blkid_probe_set_device(blkid_probe pr, int fd,
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (S_ISBLK(sb.st_mode))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 blkdev_get_size(fd, (unsigne=
d long long *) &pr->size);
>> + =A0 =A0 =A0 =A0 =A0 =A0 else if (S_ISCHR(sb.st_mode))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr->size =3D 1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr->size =3D sb.st_size;
>> =A0 =A0 =A0 }
>
> this is the same situation, this code will for all char devices, but we
> want to support UBI only.

I don't know if there is a "good" way to detect an ubi device using
only struct stat.

Artem, any idea ?

--=20
Corentin Chary
http://xf.iksaif.net
