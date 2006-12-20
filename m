Received: from nf-out-0910.google.com ([64.233.182.187])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gx3pJ-0003Vg-Mn
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 10:57:56 -0500
Received: by nf-out-0910.google.com with SMTP id i2so1323006nfe
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Dec 2006 07:57:42 -0800 (PST)
Message-ID: <625fc13d0612200757m34fe6904pe397759dd543c1fa@mail.gmail.com>
Date: Wed, 20 Dec 2006 09:57:42 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Tom Rathbone" <tom.rathbone@gmail.com>
Subject: Re: Physmap, exposing a master partition/device.
In-Reply-To: <777da1740612200737w42e9f1f0w3d6be624ef72b256@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <777da1740612200737w42e9f1f0w3d6be624ef72b256@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/06, Tom Rathbone <tom.rathbone@gmail.com> wrote:
> Hi All,
>
> Using physmap partitions I'd like to be able to write to my flash
> device as a whole and also access it as partitions.  This way under
> usual operation I can use the partitions and when doing a full
> re-flash I can write the whole device including the partition table
> and can also write across partition boundaries.

This is a typical thing to do, yes.

> What changes would be required to include a master partition? Can I do
> this separately using add_mtd_device? Alternatively is there a way to
> unpartition the flash from userspace?

Usually the master MTD device is created by the board driver itself
before or after creating the partitions by calling add_mtd_device.  I
know of no way to dynamically unpartition from userspace.

josh
