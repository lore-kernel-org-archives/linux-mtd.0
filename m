Received: from mail-gx0-f178.google.com ([209.85.217.178])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LvyCs-0004K8-GR
	for linux-mtd@lists.infradead.org; Mon, 20 Apr 2009 18:27:09 +0000
Received: by gxk26 with SMTP id 26so1305830gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Apr 2009 11:27:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1240126383.3589.46.camel@macbook.infradead.org>
References: <1c3f4270904181955g28d25ef5nef3cc3001c0d3a06@mail.gmail.com>
	<1240126383.3589.46.camel@macbook.infradead.org>
Date: Mon, 20 Apr 2009 11:27:00 -0700
Message-ID: <1c3f4270904201127o4c0eea30pb17a1a775a7b5d0d@mail.gmail.com>
Subject: Re: jffs2 filesystem/flash data integrity
From: Manoj <manoj23@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

How do you want me to give the image that's on the flash? It is in megabyte=
s.
Or do you want me to give the output of jffs2dump for the image?

Thanks.

On Sun, Apr 19, 2009 at 12:33 AM, David Woodhouse <dwmw2@infradead.org> wro=
te:
> On Sat, 2009-04-18 at 19:55 -0700, Manoj wrote:
>> Hi,
>>
>> I have a jffs2 filesystem on NAND flash. After mounting the jffs2 fs,
>> I create a 2MB file and make a copy of it using "cp" command. When I
>> do a "diff" between two files, the files are same. Now, I unmount the
>> fs and re-mount it. When I do a "diff" between the two files, they
>> differ. Looking at the difference, I see that around 4K of data in one
>> file has 0s in it. This 4K hole can be anywhere in the file. =A0There is
>> no issue with a 1MB file.
>
> Please reproduce with 'CONFIG_JFFS2_FS_DEBUG=3D1', capturing all kernel
> message over a serial console. Also, take an image of the flash before
> you remount it. Let me have both.
>
> --
> dwmw2
>
>
