Received: from moutng.kundenserver.de ([212.227.126.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zlg-0004lH-63
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:19:35 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
Date: Wed, 19 Dec 2007 15:17:17 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<20071219154158.23264.95037.sendpatchset@golum>
In-Reply-To: <20071219154158.23264.95037.sendpatchset@golum>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200712191517.18166.arnd@arndb.de>
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 December 2007, Artem Bityutskiy wrote:
> +/**
> + * struct ubi_attach_req - attach MTD device request.
> + * @vid_hdr_offset: VID header offset
> + * @data_offset: data offset
> + * @mtd_num: MTD device number to attach
> + * @padding: reserved for future, not used, has to be zeroed
> + *
> + * This data structure is used to specify MTD device UBI has to attach a=
nd the
> + * parameters it has to use. The "attach MTD device" ioctl returns the n=
umber
> + * of the newly created UBI device as the return value.
> + */
> +struct ubi_attach_req {
> +=A0=A0=A0=A0=A0=A0=A0int32_t vid_hdr_offset;
> +=A0=A0=A0=A0=A0=A0=A0int32_t data_offset;
> +=A0=A0=A0=A0=A0=A0=A0int32_t mtd_num;
> +=A0=A0=A0=A0=A0=A0=A0uint8_t padding[12];
> =A0};


Can you explain why you need to pass vid_hdr_offset /and/ data_offset here?
What is the difference between the two? Can't you autoprobe them if you
have the device?

The reason I'm asking is that I'd really like to make this a simple
attribute in sysfs, in the mtd object. The question there is what a
user would need to store into that attribute. The device is identified
implicitly already, but this looks like you still need two distint
integers in order to create an UBI device.

	Arnd <><
