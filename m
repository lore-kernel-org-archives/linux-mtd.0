Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0Aq3-0003pQ-NJ
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 16:48:52 +0000
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana>
Cc: "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>,
 "Babu, Viswanathan (V.)" <vbabu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <573210D8.6030603@nod.at>
Date: Tue, 10 May 2016 18:48:24 +0200
MIME-Version: 1.0
In-Reply-To: <20160510145836.GA18568@visteon-gnana>
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

Am 10.05.2016 um 16:49 schrieb DHANAPAL, GNANACHANDRAN (G.):
> Thanks for the reply, Richard. 
> Please find two files in google drive share.
> 
> 	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
> 	2. leb_peb_map_22706.log   - LEB to PEB map. This information is taken by having print in table.
> 
> Share:
> 	https://drive.google.com/open?id=0B7tYZDLZ_KAZMFd4MENlQkJuNjA

Hmm, the share contains only log files.
I need a pristine dump of your NAND (created by nanddump without OOB data) to analyze the issue.

Thanks,
//richard
