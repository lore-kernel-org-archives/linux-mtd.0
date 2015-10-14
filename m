Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmUNI-0003rw-9m
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 22:18:21 +0000
Subject: Re: UBIFS corruptions on NOR-Flash
To: Roshni Shah <roshni.shah@timesys.com>, Han Xu <xhnjupt@gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
 <56058D7B.3050005@nod.at>
 <CA+EcR22DEGWr8v-iMDQBf=NNL3+6SsOBDX6mX5y_O9en4FaPyQ@mail.gmail.com>
 <CA+-FG62yDf2hbEgo6At92pwPOWbXjTSwQ-WrJjX2z2z-VBYZ=Q@mail.gmail.com>
 <CA+-FG61mEsrOu_WGUuCm-xgKM4afxSrw2JyQUwCi8BPJU3gkQQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <561ED48D.5010002@nod.at>
Date: Thu, 15 Oct 2015 00:17:49 +0200
MIME-Version: 1.0
In-Reply-To: <CA+-FG61mEsrOu_WGUuCm-xgKM4afxSrw2JyQUwCi8BPJU3gkQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 14.10.2015 um 16:33 schrieb Roshni Shah:
> Hi Han, Richard,
> 
> Any other ideas / tests that I could perform to help narrow down the
> issue further? I really appreciate you taking the time.

I don't have this hardware, so I cannot say much.

Does the dump of the corrupted data make sense?
IOW are only a few bits flipped or is it completely
garbage?

Han, have you ever tested this driver with UBI?
As I said UBI uses vmalloc'ed buffers. Maybe the driver
is "UBI unfriendly" and needs tamed.

Thanks,
//richard
