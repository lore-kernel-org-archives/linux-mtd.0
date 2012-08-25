Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T53sx-0002T3-AE
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 00:05:56 +0000
Received: by lagu2 with SMTP id u2so1403800lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 17:05:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345809360.2848.296.camel@sauron.fi.intel.com>
References: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
 <1345809360.2848.296.camel@sauron.fi.intel.com>
Date: Fri, 24 Aug 2012 17:05:45 -0700
Message-ID: <CAN8TOE-aU=Z2CXiV0RO_zudbivCwnyQhghr5S7FdgHCe4cMZug@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read support
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 4:56 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-08-13 at 16:35 -0500, Jeff Westfahl wrote:
>> Added a NAND device flag for subpage read support. Previously this was
>> hard coded based on large page and soft ECC.
>> Updated base NAND driver to use the new subpage read flag if the NAND is
>> large page and soft ECC.
>>
>> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
>
> Brian, would you have a chance to review this patch?

Yes, I can try. I'll give it a little more thought on Monday.

But I have an initial question: why do you need this patch?
Specifically, is there a driver you have that supports/needs this
change? Right now, your new flag won't be used for anything new.

Side note: I have always thought that it was strange to have
subpage-read support only baked into SOFT_ECC mode. There are
presumably many potential applications in which a non-SOFT_ECC system
could read partial pages safely.

Brian
