Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNd4H-0004f7-Gg
 for linux-mtd@lists.infradead.org; Tue, 17 Feb 2015 07:59:41 +0000
Message-ID: <1424159956.30682.4.camel@sauron.fi.intel.com>
Subject: Re: UBIFS handling of erased page errors
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Tue, 17 Feb 2015 09:59:16 +0200
In-Reply-To: <EACD232272DA4849B060F0828564D13B56E32C0D5A@ntcex01.corp.netcomm.com.au>
References: <EACD232272DA4849B060F0828564D13B56E32C0D59@ntcex01.corp.netcomm.com.au>
 ,<1424075632.2573.225.camel@sauron.fi.intel.com>
 <EACD232272DA4849B060F0828564D13B56E32C0D5A@ntcex01.corp.netcomm.com.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-02-17 at 17:39 +1100, Iwo Mergler wrote:
> Hi Artem,
> 
> 
> thank you for the analysis of my unexpected lottery win. ;-)
> 
> I couldn't see a likely debugfs entry for in-the-gaps allocation,
> which one is it?

OK, there is no separate knob for this, but it could be added if needed.
Right now the feature is enabled with the 'chk_index' knob. This knob is
about extra index checks, which slow down the FS. But it also forces
'in-the-gaps' from time to time.

> I'll go and tell the customer to delete files occasionally.

Not sure about how deleting is helpful.

Artem.
