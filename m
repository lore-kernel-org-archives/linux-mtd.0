Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFFMf-00023O-IW
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 00:45:54 +0000
Received: by pzk28 with SMTP id 28so1610267pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Apr 2011 17:45:51 -0700 (PDT)
Message-ID: <4DB8B8B9.4050604@gmail.com>
Date: Wed, 27 Apr 2011 17:45:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Grazvydas Ignotas <notasas@gmail.com>
Subject: Re: [RFC] mtd: nand: Fix bad block identification issue
References: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
	<BANLkTi=sq5am1HKeOfYTmYHUm96O08N-jw@mail.gmail.com>
In-Reply-To: <BANLkTi=sq5am1HKeOfYTmYHUm96O08N-jw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, "Saxena,
	Parth" <parth.saxena@ti.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 4/27/2011 8:45 AM, Grazvydas Ignotas wrote:
> Brian,
> 
> did you really intend to remove badblockbits? Maybe it should go back
> to nand_base.c?

No, I had no intention of the sorts! It surely should not have been
removed in the first place. I will "ack" a patch to revert it, or next
time I'm at my work machine I'll write one myself.

As a defense for myself...I think I was relatively new to git + kernel
hacking at the time I sent this patch. Sorry for the messup.

> On Wed, Apr 27, 2011 at 3:09 PM, Saxena, Parth <parth.saxena@ti.com> wrote:
>> Commit e0b58d0 ("mtd: nand: add ->badblockbits for minimum number
>> of set bits in bad block byte") by Maxim Levitsky added
>> badblockbits to nand_chip to specify minimum number of set bits
>> in bad block byte. The patch initialized badblockbits to 8 in
>> nand_base.c, but later the initialization line got removed by commit
>> c7b28e2("mtd: nand: refactor BB marker detection"). After this all
>> NAND drivers with NAND_SKIP_BBTSCAN are forced to initialize it to 8.
>> Otherwise bad block identification will fail.

Brian
