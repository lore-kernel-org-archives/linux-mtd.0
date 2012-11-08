Received: from mail.ch.keymile.com ([193.17.201.103])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWVAN-0002pl-1D
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 16:41:20 +0000
Message-ID: <509BDFBD.3030604@keymile.com>
Date: Thu, 08 Nov 2012 17:37:17 +0100
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
To: Christopher Harvey <charvey@matrox.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
In-Reply-To: <509BDE9B.3080909@keymile.com>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,
On 11/08/2012 05:32 PM, Gerlando Falauto wrote:
>
>> Ran a trace on some manually inserted bitflips, and the block was moved.
>
> Could you give some pointers on how to manually insert bitflips?
> nanddump/nandwrite from mtd-utils perhaps?

And BTW, wouldn't you also need to explicitly disable on-die ECC in 
order to force that, anyway?

Thanks again!
Gerlando
