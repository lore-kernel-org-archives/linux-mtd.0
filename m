Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S90tV-0005xq-Gt
 for linux-mtd@lists.infradead.org; Sat, 17 Mar 2012 21:10:33 +0000
Message-ID: <4F64FDC2.9090400@newsguy.com>
Date: Sat, 17 Mar 2012 14:10:26 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316235424.60a62ed0@halley> <4F63C571.4000400@gmail.com>
In-Reply-To: <4F63C571.4000400@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/16/2012 03:57 PM, Peter Barada wrote:
> On 03/16/2012 05:54 PM, Shmulik Ladkani wrote:
> I think the indication from MTD should be the worst case found in
> all the ECC steps...


Yes, that's the consensus.  Some of us are just a litle slow :)
