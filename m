Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D75C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idcH049mSVB3vd+RrjeAP04Y7pidj9Bkq2aawZm2iBw=; b=iwmJxPO0IFcf8t
	tDQLZ4hhwG6gZDlPIptKzAGRq9PO9OSNHYYAterIWz+WXUhFwHrgwYc6AMlNsPpUzLjuRoQsuvcj0
	s7a2wQ9vd4/eL0d5VyoW+drmb2uVfgJUVBw+6VdDEUNqHmlj14fLNPXz9SYHfdugLWLMpy79Tm7sr
	L8Hw7l3vZ+trRzxmQ9lO+GhmjuutpVIbP2E9sQfGKnkQ//33W6NhGPLzM7UqoT5Lo1NokilJJCarV
	VFh8dEYGkNL9zvIsyntz0jG8bDrFhTtgazQfhEpiIqFycvSmyAkNEZvTJW1/exMrOvGWIE6VD1nIc
	xBZBlXkaHtmeZMycy5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUeB-00Aiwz-AZ; Thu, 20 Jan 2022 10:26:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUe7-00AivH-8U
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 10:26:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id cx27so26769234edb.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGMN4xGjg+o6QoJ44cTAJy3EoI/BfCzruq/U/oyo1EA=;
 b=1bh8pRp0rsdsyNzTV3jbFAYkownsjkto0ITxip/tvWKrI0Xk6JSqex2gE3BEf93iGH
 Rm+KzU9BfjYKM7TE8GWbZDMX0aMf2UWdlkyk1Q/cCcUzhAcxlK/xT3NEidvgS1eJoGOm
 LCZC4NlWbUDcohQnDJIunDABve9pI8DvL741hh11jk8YcXrzlOtIjFUqy848zrLOqAgX
 9qjbpdWx+CGa1UkwgSGCbwsRBpFFmno4HE7BJ0C8qoKlf5NPLJPAdgaxevOQhixIIwi1
 Gd/aIEO7vzy0dyapnOFWlcAwFOarfiIBHYnMsKZIwhFwpgMoBVlX9hbjw0lhOM126Pps
 AGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGMN4xGjg+o6QoJ44cTAJy3EoI/BfCzruq/U/oyo1EA=;
 b=DsXHz+Ip7hp+ElwHtIy//SRk6GZF1JsOkmBcpKThlZ3MPD6m5loS5zU72uB67keIvJ
 Yx+l7tLjOHzUn6vgPg14UEhVoFe9RoPz8OpzoxdIvXdewFao1T17ci7EPvof/w6SorXY
 Oc6oukKN1DihNNNNRs1HGp/efpflrbSuigZgAyiTUKKirBU3rcfhtvNqh2CDYBxLqMbG
 fi5qsQlPlh7j0+YnTwTY5grTIKgpZYDgDjQg/QzPCYrKq/66CAygWp9FnqS4uOayo3sI
 myVxVZgmMAstvb3zI7IdDgsRNxo9u+pagHzZ4mNr76GbddD9SbIAt589qgTPZ+SYVD4i
 Qr4A==
X-Gm-Message-State: AOAM532FiLEFWyYBxnLwD7fFAdpOz9coRSeLyCk5vW5DB4x8qThcjTIC
 UoNLq+FgEsacTgwDHm6+zYMYsmo4qB0N56xmBCO3Mg==
X-Google-Smtp-Source: ABdhPJwJYLmsrS6H1ZBVZgU6HRoUaK2Gq6o0anJPz9fB7mHjE6chnL5wm/OJO+NX/khrA72fv0OlRpaW/sdJBxgpKIY=
X-Received: by 2002:a17:906:5509:: with SMTP id
 r9mr28486850ejp.389.1642674380456; 
 Thu, 20 Jan 2022 02:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20210801234509.18774-1-ezequiel@collabora.com>
 <20211026150350.GA5136@localhost>
 <CAAEAJfD0ctKon7onbj5cCgN9OUnXpQ-gxG=DF6hXD9hW+Pw83A@mail.gmail.com>
 <20220120103946.3a18aee7@xps13>
In-Reply-To: <20220120103946.3a18aee7@xps13>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 20 Jan 2022 07:26:09 -0300
Message-ID: <CAAEAJfCy2WvOrZ==eVTS2mYjkd3_Vj8ysDbP3L_aU0cE8S4ceg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Trevor Woerner <twoerner@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_022623_451669_597193F0 
X-CRM114-Status: GOOD (  37.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 20 Jan 2022 at 06:39, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Ezequiel,
>
> ezequiel@vanguardiasur.com.ar wrote on Fri, 12 Nov 2021 10:54:36 -0300:
>
> > Hi Trevor,
> >
> > I am not reachable at ezequiel at collabora.com, so I missed this
> > thread. Sorry about the delay, replying.
> >
> > On Tue, 26 Oct 2021 at 12:05, Trevor Woerner <twoerner@gmail.com> wrote:
> > >
> > > On Sun 2021-08-01 @ 08:45:02 PM, Ezequiel Garcia wrote:
> > > > Hi Richard, and everyone else:
> > > >
> > > > Browsing the internet for "JFFS2 mtd" results in tutorials, articles
> > > > and github.gists0 that point to mtdblock.
> > > >
> > > > In fact, even the MTD wiki mentions that JFFS2
> > > > needs mtdblock to mount a rootfs:
> > > >
> > > >   http://www.linux-mtd.infradead.org/faq/jffs2.html
> > > >
> > > > Moreover, I suspect there may be lots of users
> > > > that still believe mtdblock is somehow needed to
> > > > mount SquashFS.
> > > >
> > > > I've taken a verbose route and added a pr_warn
> > > > warning if the devices are NAND. I don't think using
> > > > NAND without UBI is too wise, and given the amount
> > > > of outdated tutorials I believe some advertising
> > > > will help.
> > >
> > > Not all NAND partitions on a device will contain linux root filesystems. For a
> > > linux root filesystem perhaps using UBI/UBIFS is preferred, yet these messages
> > > print out for each and every NAND partition:
> > >
> > >         [    0.900827] Creating 8 MTD partitions on "nxp_lpc3220_slc":
> > >         [    0.906431] 0x000000000000-0x000000020000 : "bootrom"
> > >         [    0.913523] mtdblock: MTD device 'bootrom' is NAND, please consider using UBI block devices instead.
> > >         [    0.933334] 0x000000020000-0x000000080000 : "uboot"
> > >         [    0.940439] mtdblock: MTD device 'uboot' is NAND, please consider using UBI block devices instead.
> > >         [    0.963322] 0x000000080000-0x000000440000 : "fbkernel"
> > >         [    0.970655] mtdblock: MTD device 'fbkernel' is NAND, please consider using UBI block devices instead.
> > >         [    0.993361] 0x000000440000-0x000000920000 : "fbrootfs"
> > >         [    1.000725] mtdblock: MTD device 'fbrootfs' is NAND, please consider using UBI block devices instead.
> > >         [    1.023315] 0x000000920000-0x000000ce0000 : "c_kernel"
> > >         [    1.030722] mtdblock: MTD device 'c_kernel' is NAND, please consider using UBI block devices instead.
> > >         [    1.053444] 0x000000ce0000-0x000000d00000 : "c__atags"
> > >         [    1.060742] mtdblock: MTD device 'c__atags' is NAND, please consider using UBI block devices instead.
> > >         [    1.083349] 0x000000d00000-0x000001000000 : "c_rootfs"
> > >         [    1.090702] mtdblock: MTD device 'c_rootfs' is NAND, please consider using UBI block devices instead.
> > >         [    1.113335] 0x000001000000-0x000020000000 : "mender"
> > >         [    1.131627] mtdblock: MTD device 'mender' is NAND, please consider using UBI block devices instead.
> > >
> > > NAND tends to be something found on older devices, the firmware/bootloaders
> > > of older devices couldn't possibly understand UBI/UBIFS so many of these
> > > partitions need be "raw" partitions, or use something that predates UBI.
> > >
> > > Ironically my "mender" partition contains a UBI (with multiple UBIFSes inside)
> > > yet I got the same "please use UBI" message as all the others (lol)
> > >
> > > I'm specifying my partitions in DT with:
> > >
> > > partitions {
> > >         compatible = "fixed-partitions";
> > >         #address-cells = <1>;
> > >         #size-cells = <1>;
> > >
> > >         mtd0@0       { label = "bootrom";   reg = <0x00000000 0x00020000>; };
> > >         mtd1@20000   { label = "uboot";     reg = <0x00020000 0x00060000>; };
> > >         mtd2@80000   { label = "fbkernel";  reg = <0x00080000 0x003c0000>; };
> > >         mtd3@440000  { label = "fbrootfs";  reg = <0x00440000 0x004e0000>; };
> > >         mtd4@920000  { label = "c_kernel";  reg = <0x00920000 0x003c0000>; };
> > >         mtd5@ce0000  { label = "c__atags";  reg = <0x00ce0000 0x00020000>; };
> > >         mtd6@d00000  { label = "c_rootfs";  reg = <0x00d00000 0x00300000>; };
> > >         mtd7@1000000 { label = "mender";    reg = <0x01000000 0x1f000000>; };
> > > };
> > >
> > > which is why, I assume, I'm getting these messages. Is there a UBI-friendly
> > > way to define them to avoid these messages?
> > >
> >
> > I feel the messages are actually helping you. You should not have mtdblock
> > on any of these MTD devices, if I understood correctly, since you are not
> > mounting a filesystem on any of them.
> >
> > Just disable MTDBLOCK on your build and you will be good to go.
> >
> > I am inclined to just leave the warnings, although they look spammy,
> > precisely to help catch this mis-setups.
>
> I keep getting complaints about these messages because they are
> spawned several times in a boot (each device or partition, I don't
> recall) while mtdblock is not even used. I understand it would be best
> to have it disabled in this case but could we find a way to be less
> invasive?
>

If we still want to keep the warning, I suppose that moving these warnings
to blktrans_open should help ... unless the block device open ends
up being called anyway, and still gets spammy.

The alternative is removing them, perhaps adding a message to config MTD_BLOCK
about UBI blocks?

Thanks,
Ezequiel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
