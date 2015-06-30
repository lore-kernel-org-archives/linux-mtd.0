Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9ppa-0000s7-Oq
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 07:19:48 +0000
Message-ID: <559242F7.1020701@nod.at>
Date: Tue, 30 Jun 2015 09:19:19 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dedekind1@gmail.com
Subject: Re: [RFC PATCH RESEND] mtd-utils: Restructure the mtd-utils source.
References: <1435647022-7318-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435647022-7318-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.06.2015 um 08:50 schrieb Dongsheng Yang:
> * There is no code modification in this commit, only moving
> * the files to proper place.
> 
> The user tools looks a little messy as we place almost
> the all tools in the root directory of mtd-utils. To make
> it more clear, I propose to introduce the following structure
> for our source code.
> 
> mtd-utils/
> 	|-- lib
> 	|-- include
> 	|-- misc-utils
> 	|-- flash-utils
> 	|-- jffsX-utils
> 	|-- nand-utils
> 	|-- nor-utils
> 	|-- ubi-utils
> 	|-- ubifs-utils
> 	`-- tests
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Hmm, while I agree with you that the current directory structure is not perfect
I'm not sure if it is worth the hassle. Because your patch hurts git blame.

Thanks,
//richard
