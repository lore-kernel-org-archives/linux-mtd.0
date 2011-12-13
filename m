Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaYpF-0004jW-V1
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 20:19:46 +0000
Received: by lahc1 with SMTP id c1so40757lah.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2011 12:19:42 -0800 (PST)
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Tue, 13 Dec 2011 22:19:39 +0200
In-Reply-To: <1323793537.97386.YahooMailNeo@web114612.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
 <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
 <1323380555.2074.3.camel@koala>
 <1323700170.52922.YahooMailNeo@web114608.mail.gq1.yahoo.com>
 <1323707647.27436.8.camel@sauron.fi.intel.com>
 <1323709988.3066.YahooMailNeo@web114618.mail.gq1.yahoo.com>
 <1323793537.97386.YahooMailNeo@web114612.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323807580.2207.1.camel@koala>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-13 at 08:25 -0800, Reginald Perrin wrote:
> 
> > echo 4 > /sys/module/ubifs/parameters/debug_tsts
> > 
> > Mount: http://pastebin.com/rh5vz4xB
> > 
> > echo 2052 > /sys/module/ubifs/parameters/debug_tsts
> > 
> > Mount and scan:  http://pastebin.com/C87dYK1g
> > 
> > However, I don't see a huge difference.  Did I do that right?
> > 
> > Thanks, RP
> > 
> 
> Artem,
> 
> We're the pastebin's helpful?  Not sure I saw a response on this.

I did respond - I wrote "dmesg" - I meant that you have to run 'dmesg'
to produce full output. These pastebins do not contain all theuseful
information because it was not printed to your console. So:

echo >
mount
dmesg
->> to pastebin.

Artem.
