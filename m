Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1DYA-0001fD-QJ
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 13:54:43 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
 <573345F4.9070203@nod.at> <57348554.6010805@nod.at>
 <20160513095004.GA6195@visteon-gnana>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5735DC82.2010309@nod.at>
Date: Fri, 13 May 2016 15:54:10 +0200
MIME-Version: 1.0
In-Reply-To: <20160513095004.GA6195@visteon-gnana>
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

Am 13.05.2016 um 11:40 schrieb DHANAPAL, GNANACHANDRAN (G.):
> Richard,
> 
> I believe CRC value for a node  is calculated in RAM before writing the node in NAND. 
> In this case, node CRC and calculated CRC are matching. so Will there be possibility 
> for corrupting key type area (32 bits) and keeping others intacted. or any other 
> possibility for node getting corrupted.

I have to correct myself, the branches of an index node are covered by
the node header CRC.
This makes the whole picture more strange.

You said you're facing the same issue on another unit.
Is the corruption really the same? Bad key type 5?

Thanks,
//richard
