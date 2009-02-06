Received: from fk-out-0910.google.com ([209.85.128.189])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLjK-0005hC-2G
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 08:06:30 +0000
Received: by fk-out-0910.google.com with SMTP id z23so581751fkz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Feb 2009 00:06:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233905683.17790.14.camel@localhost.localdomain>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
	<8bd0f97a0902051400t6c9e7525h28597ae442501751@mail.gmail.com>
	<1233905683.17790.14.camel@localhost.localdomain>
Date: Fri, 6 Feb 2009 09:06:28 +0100
Message-ID: <71cd59b00902060006q963be2cw9541907145b74b90@mail.gmail.com>
Subject: Re: [PATCH 1/2] MTD: add fsync capability
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just copied the mtd_close()/mtd_open() function thinking that is was
mtd's codestyle.
So, maybe it's time to clean the while file. I can try to do that next
week if I find the time.

Have the receveid "fsync() for UBI" patch ? it's seems the mail is
waiting for approval on the mailing list.


On 2/6/09, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Thu, 2009-02-05 at 17:00 -0500, Mike Frysinger wrote:
>> On Thu, Feb 5, 2009 at 16:25, Corentin Chary wrote:
>> > +static int mtd_fsync(struct file *file, struct dentry *dentry, int
>> > datasync)
>> > +{
>> > +       struct mtd_file_info *mfi =3D file->private_data;
>> > +       struct mtd_info *mtd =3D mfi->mtd;
>> > +
>> > +       DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");
>> > +
>> > +       /* Only sync if opened RW */
>> > +       if ((file->f_mode & FMODE_WRITE) && mtd->sync)
>> > +               mtd->sync(mtd);
>> > +
>> > +       return 0;
>> > +} /* mtd_fsync */
>>
>> adding a comment to mark the end of a function isnt common ... i'd
>> drop that.  otherwise, the patch looks pretty straightforward to me,
>> but i'm not a big VFS guru ;).
>> -mike
>
> The patch looks fine for me, except of the weird end comment, and
> the ancient ugly "DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");" ...
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>


--=20
Corentin Chary
http://xf.iksaif.net
