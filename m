Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEYqW-0004qc-SA
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 09:16:49 +0000
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
To: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
Cc: dwmw2@infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 dedekind1@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <576662E9.7020700@nod.at>
Date: Sun, 19 Jun 2016 11:16:25 +0200
MIME-Version: 1.0
In-Reply-To: <57665D96.1070804@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.06.2016 um 10:53 schrieb Richard Weinberger:
>> Thus it'd be nicer to flag the default rootfs volume via the device-
>> tree.
> 
> As I said, as far I'm informed device tree is for configuring Linux, it describes
> the hardware. We also don't have LVM, DM or iSCSI bindings in DT. ;)
> Maybe device tree folks will tell more...

Should be read "... is *not* for configuring Linux ...".

Thanks,
//richard
