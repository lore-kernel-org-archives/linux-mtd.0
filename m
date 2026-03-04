Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44420EB7EAC
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gZlPAzpS6TMMePbrRJqtXpnIpL2KrFrUimTpwJC1J4=; b=MVtMBmdpykPbPE
	bMnM0M3dYa75UKtO95AlE0K7NnJMGoP+uH8SGK4IPAssRPl5qrNGVfaHCa+muBP02NPPKKJGRBwNu
	J2fyTC0LosuLh1KRYGhVN+p04zimbnR3SnTjGdXlYc3ObsdIKmWpcFduMwlcFCIgxxAHpCGFyxjP6
	mVNswMs4YXzLZ8JlqogI2CU3laKNmEyQO/RMDesytxSDkDmmqzhctf7mpGl+sSkWMn/sMAVyUIxba
	Xb0Enfyvimj4WcQVpcksA+1K/AtLPuqreG2p+rT8ppdE5+AjR3QELMJUNnSVLPZQwapiPScPeDCCd
	09Q3JuqDANvWsx9fl0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiYz-0000000GsD8-07ly;
	Wed, 04 Mar 2026 09:30:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiYw-0000000GsCO-2YLT
	for linux-mtd@lists.infradead.org;
	Wed, 04 Mar 2026 09:30:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48371119eacso80386785e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772616636; x=1773221436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
        b=mQ0v5yLl3QjrrqgYQwZsLs5eLZjrUqAelQLO7LBclIxyI+vqh/xIs0i00ydBoFVcRi
         QGp28rcdZ3U/t2+nyOKJTFHt1yoYGWI4ZRC8PXZWB7BEpx9GtA32+bSXNUOSxSGO2SSb
         qRzVnVfa7tC41ln2fEIc8AUMSlQeN86SCzAuCOJf1FFC0ak2Pqs6WLlH+p8jH6GIGw3x
         pylEngAFtiF+gEn6q8FsB6uuKZyWAjmFBYM0JJuFC+9mU8JOCWf1KWW8hTsK3qLhwTHd
         MZ5J38S+RUUl3OR3d9tFU9WUtSb1+7vA+rKUNbC4Lzv6tR33wWij+Jem9ZB5JeYwCWL4
         TmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616636; x=1773221436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
        b=EUEmf9tDeCjw4A32JypIGmhpxWn4UwPLYOMY2e4l4fhhKmuoOcaF64jKNCL172kJW+
         ckd742M9i1Vt2MEsdkFLmEjiA6vOR/z1uV/Vp3du5mZ9VMB4dt7VWn0HBBfV4TUmUrEB
         yhf7a/EobvEYwm8PooJxbKZoKf/rB6IpxO6OogtSOivTD12VADp8ZWvCQw7u9PB/ynfJ
         /bTe2ertEfxjygq95MYdLwv78LENLehf6Vu+0vfcKH6IxpnsxQ2azh5tCn/O+XGLt5/T
         KojCsE1tgCMhef7v3YaryYY+sxncAeOFD6jW7vhL35j/0h9HuILkCEle8g8QbhO0C5CH
         TLAw==
X-Forwarded-Encrypted: i=1; AJvYcCVaw+pwaANjCpEIFpEnZmuUAN3biEgXSYVjRkyixUyFT+fLYIMRP0GI4EWID31aAH4UsI3sAc7JmJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcui1Yrhg6pJi2rhWA76RrFrYIabygQeIbUjoM8wUlqIND7pYN
	PjPyEbRUmFzengjOSuskP6mo7UoweYKwJdZpYBXhBfV30wPHUhhcj9ih
X-Gm-Gg: ATEYQzyDF+3/2iErChBfOC2PdJ/0chH7FaL88cPI1Ks2uZVqr/63nbIIQc3OAsT4V1Y
	9Ln+iCgl14j/heIyaolz519e76OBFFxUQ7hMfd1vP7DOcbqjofHAvQh5CWgMwc6XaS89VheETJ0
	M+jfBrjauOhAl2x4U0KejuuG3zMfSDCQ+e9yqoc3ufy93S/OrfqVgwSwHPDjY3rO5+sxL8wp14p
	JeV9Y7A0Swx/t/bHzntphpBgY6E4GUHyVKPiZ/KgEOuRgvqIFJNuxijS71mMzyd4MBDkmADgyXj
	1tBQLr7vOLAlWwk3DAptn8lkH920qKZUrWp3rpAkjKvWugVh3aEYdoP7qIZA8kgo5T8gLwVZX7E
	aR7NJrcHxnzHGYZCiHOxi2dXHp2DXT4axz9OwU9kfTt+7RdkYdrp5EuoPa7j4sm/t5p6M0JDPlu
	kEF2lN4tvmkc84A4hN+byk1/Z/VfvHCI8MBPPQf5glxkVJ2p8xnn06JWrjE9vi5rRu
X-Received: by 2002:a05:600c:8b53:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-4851989024emr19550785e9.26.1772616636117;
        Wed, 04 Mar 2026 01:30:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884225asm38972555e9.6.2026.03.04.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:30:35 -0800 (PST)
Date: Wed, 4 Mar 2026 09:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: NeilBrown <neilb@ownmail.net>
Cc: "Jeff Layton" <jlayton@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org,
 netfs@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev,
 linux-afs@lists.infradead.org, autofs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org,
 linux-x25@vger.kernel.org, audit@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org,
 linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 000/110] vfs: change inode->i_ino from unsigned long
 to u64
Message-ID: <20260304092559.554ac9a9@pumpkin>
In-Reply-To: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
	<1787281.1772535332@warthog.procyon.org.uk>
	<1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
	<177260561903.7472.14075475865748618717@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013038_669371_30957187 
X-CRM114-Status: GOOD (  22.01  )
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

On Wed, 04 Mar 2026 17:26:59 +1100
NeilBrown <neilb@ownmail.net> wrote:

> On Tue, 03 Mar 2026, Jeff Layton wrote:
> > On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:  
> > > Jeff Layton <jlayton@kernel.org> wrote:
> > >   
> > > > This version splits the change up to be more bisectable. It first adds a
> > > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > > for format strings. The conversion is done, and then everything is
> > > > changed to remove the new macro and typedef.  
> > > 
> > > Why remove the typedef?  It might be better to keep it.
> > >   
> > 
> > Why? After this change, internel kernel inodes will be u64's -- full
> > stop. I don't see what the macro or typedef will buy us at that point.  
> 
> Implicit documentation?
> ktime_t is (now) always s64, but we still keep the typedef;
> 
> It would be cool if we could teach vsprintf to understand some new
> specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
> gcc warnings.

A more interesting one would be something that made gcc re-write the
format with the correct 'length modifier' for the parameter.

That would save a lot of effort!

	David

> 
> NeilBrown
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
