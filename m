Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpS1Z-000878-96
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 00:47:21 +0000
Received: by mail-qg0-f47.google.com with SMTP id j107so15701968qga.34
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 17:46:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAEA280@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EAD825F@DBDE04.ent.ti.com>
 <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
 <CAE94FHEEpdyO-4nk-CVvSh6agECKsMibxSzgS=U_8osdVav5Rg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAEA280@DBDE04.ent.ti.com>
Date: Wed, 28 May 2014 08:46:59 +0800
Message-ID: <CAE94FHGWL52hZtzTMbMiM87BV5QPHtELAgoXRDPVxjDjZsR7pw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop
 error
From: Ted Juan <ted.juan@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

Thanks for your patience to answer my question again.



> So, while sending stable patches use following command to avoid below error
> 'git send-email ---suppress-cc=bodycc'
>
> Also refer:
> http://lists.infradead.org/pipermail/linux-mtd/2014-May/053911.html
> [2] Documentation/stable_kernel_rules.txt.
