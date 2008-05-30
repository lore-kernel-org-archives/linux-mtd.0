Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1xxv-0000Tf-VK
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 06:19:52 +0000
Subject: Re: mkfs.ubifs, ubinize, ubiupdatevol request!
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
References: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 30 May 2008 09:21:46 +0300
Message-Id: <1212128506.31023.95.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2008-05-29 at 15:02 +0800, Nancy wrote:
>        I don't know what's the detail differences between mkfs.vfat
> and windows format program.  For me, the speed problem is really hard
> to find. Is there anyone who can give me a hint?

I do not know much about vfat and cannot help here.

>        when I dump VFAT volume to a file, there have ummapped LEBs in
> between Cause the windows format program will write the last LEB. But
> I can't dump the ummaped LEBs to files due to the dump file size
> limitation. So I have to teach ubiupdatevol and ubinize to .....   Oh
> please, that's really hard things for me.

Actually what we could do is to create a simple program which would dump
whole _MTD_ device, and basically drop unmapped physical eraseblocks.
This is just easier to do. Something like this:

fd =3D open(/dev/mtdX);
for (each physical eraseblock) {
	read(fd, buf, peb_size);
	/* Check if PEB is not mapped by checking that there is not VID
           header */
	if (vid_header_is_not_present())
		/* This PEB is unmapped, it is safe to drop it and
		   switch to the next PEB */
		continue;
	/* Write data to the output file */
	write(output_file_descriptor, buf, peb_size);
=09
}

Afterward, you will be able to just flash the resulting dump with
"ubiformat".

But of course, you will dump all volumes this way, not just one. Does
this work for you?

This should be easy to write this tool. I could do this but I am very
busy at the moment and basically have not time, may be later.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
