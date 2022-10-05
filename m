Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4FDC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2vr1xmTJPVLMXJmO6swav3xOaPIsJxYGkPmzQdo3to=; b=qeB0zcIDpGyEdp
	lFo3SZe7UkMB/cVBqptiePal1nbV4yOamiBYL0Qz3tgIU/mhuyM/3w2J//PKoQBIVzRGvibJ3y7de
	zEMQS62rZGORODyTwPBjKfHWY4hUSj+o998QkLgdwqkHjj6/NjQuXwWf208OmPRjQFheZk7qkyAZT
	oX0AuWAn/RAjjZE1Biowbsd19pxG8YVAJivnSeL8B27s3SlG8LZAPUAUvcwJgpf5K2AgKTocBw+Mm
	JEdV5fl4g4IsDqeppdnB7uUwlcHZ8cC/v9yaiI+PwhMzlmEhqd1ZUYeVODbimnb84pxu6J72WE4RH
	vQCrn6oHdq6hUPAMl8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyJC-00CjBV-Pg; Wed, 05 Oct 2022 06:55:10 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyJA-00Cj9j-3E
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 06:55:09 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D46F0320076F;
	Wed,  5 Oct 2022 02:54:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 02:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664952897; x=1665039297; bh=jWTbZEvbtDtUpxhiaZ06jnKvT3cn
	t7nqR4YpnsdkpzA=; b=SN/B0rG//lwD0KUvExQeYgJmksgAuQTF3wbAMmkGYXw3
	tZDKhTSS0NxHUE/2Ljh3UjN1jVph4YVJNCa9EyI/k+wCFbArqwmSL7zuVXxEQvVi
	6BPctFK77GjmQwtk7oq5brX7C5oEDNKcjOhZ9omGjQffozknm0uLJGdA4Fpdc7+O
	td/p/33vN73l6G+g+1yZFfNlltEjDxBu5iRaz3KGHmhuUr8DVu9+eCj+6q9Y6g0N
	bDThAyvejofXn+tgNSPzqEjKpJejXW+D3uwo7Vp/M0MzzbGCxv99heIGcWEy5h2e
	glwIRnUzWyrOrshKeBlmMc/oubA/jYjr3y0mYPtyBw==
X-ME-Sender: <xms:Pyo9Y-Z4elN1Fe-Y2a5I_7wiI1rJYJUeIV3kNVkTTPhKeH1M5-vPwA>
    <xme:Pyo9YxY6wsMwCvFZLEPMRTXWojebDd1jhl7SQ-HfGakBHmmHIsBNCAM-QrjpNjlJS
    n9MLkASF-3dEhhAaTM>
X-ME-Received: <xmr:Pyo9Y4_XinFLEkKFqDfQkTqCnLPHtdInd6PX18SGuRvpMOawyGQ2i1yV8sHJ5MZSR1n_u-QBPC6BRl6VXUlKQWb6Xi9zpoLZ0dI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeivddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Pyo9YwqufxSZDLDkbx2_7_1aZI-PfVYfpBiX7qPsQYDRbF_Jstl4cg>
    <xmx:Pyo9Y5raNcqnWsqJdZpmQ_zJHhy3BoEiCgTYwzJt6WITb3rLAO3Alg>
    <xmx:Pyo9Y-QLMw58FfnDEeWlso5eW8V76Z0BdIwklzwU6U93vzJi8AlyUw>
    <xmx:QSo9Y_gAkX9CqBZ8zI3KIJAa8a0fZKASrx12ssz77auJ4vxMMkXv0Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 02:54:53 -0400 (EDT)
Date: Wed, 5 Oct 2022 17:54:48 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
cc: geert@linux-m68k.org, linux-block@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
    drbd-dev@lists.linbit.com, nbd@other.debian.org, 
    linux-mtd@lists.infradead.org, axboe@kernel.dk, philipp.reisner@linbit.com, 
    lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com, 
    efremov@linux.com, josef@toxicpanda.com, tim@cyberelk.net, 
    haris.iqbal@ionos.com, jinpu.wang@ionos.com, richard@nod.at, 
    miquel.raynal@bootlin.com, vigneshr@ti.com, mcgrof@kernel.org, 
    hare@suse.de, damien.lemoal@opensource.wdc.com, johannes.thumshirn@wdc.com, 
    bvanassche@acm.org, ming.lei@redhat.com, vincent.fu@samsung.com, 
    shinichiro.kawasaki@wdc.com
Subject: Re: [RFC PATCH 15/18] swim: use init disk helper
In-Reply-To: <20221005050027.39591-16-kch@nvidia.com>
Message-ID: <78eb3d46-de71-a20c-ed5a-efc6ce71f571@linux-m68k.org>
References: <20221005050027.39591-1-kch@nvidia.com> <20221005050027.39591-16-kch@nvidia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_235508_175107_7A6CED58 
X-CRM114-Status: GOOD (  14.23  )
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

On Tue, 4 Oct 2022, Chaitanya Kulkarni wrote:

> Add and use the helper to initialize the common fields of struct gendisk
> such as major, first_minor, minors, disk_name, private_data, and ops.
> This initialization is spread all over the block drivers. This avoids
> code repetation of inialization code of gendisk in current block drivers
> and any future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/swim.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/swim.c b/drivers/block/swim.c
> index 42b4b6828690..7fa4b2766367 100644
> --- a/drivers/block/swim.c
> +++ b/drivers/block/swim.c
> @@ -835,15 +835,12 @@ static int swim_floppy_init(struct swim_priv *swd)
>  
>  	for (drive = 0; drive < swd->floppy_count; drive++) {
>  		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
> -		swd->unit[drive].disk->major = FLOPPY_MAJOR;
> -		swd->unit[drive].disk->first_minor = drive;
> -		swd->unit[drive].disk->minors = 1;
>  		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
> -		swd->unit[drive].disk->fops = &floppy_fops;
>  		swd->unit[drive].disk->flags |= GENHD_FL_NO_PART;
>  		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
>  		swd->unit[drive].disk->private_data = &swd->unit[drive];
> -		set_capacity(swd->unit[drive].disk, 2880);
> +		init_disk(swd->unit[drive].disk, FLOPPY_MAJOR, drive, 1, 2880,
> +				&swd->unit[drive], &floopy_dops);
>  		err = add_disk(swd->unit[drive].disk);
>  		if (err)
>  			goto exit_put_disks;
> 

You typo'd the ops struct. By inspection, I'd say your patches 11/18 and 
16/18 will not compile either.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
