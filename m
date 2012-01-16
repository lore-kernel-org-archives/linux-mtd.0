Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmp8t-0004UF-IK
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 16:10:47 +0000
Message-ID: <4F144C38.60507@ftemaximal.fr>
Date: Mon, 16 Jan 2012 17:11:36 +0100
From: Alexandre Gambier <a.gambier@ftemaximal.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
 <1326554080.14299.2.camel@sauron.fi.intel.com>
 <4F13E424.7070104@ftemaximal.fr>
 <1326716672.14299.70.camel@sauron.fi.intel.com>
 <4F141802.5080904@ftemaximal.fr>
 <1326717092.14299.74.camel@sauron.fi.intel.com>
In-Reply-To: <1326717092.14299.74.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 01/16/2012 01:31 PM, Artem Bityutskiy wrote:
>>> You should be able to find the UBI overhead formulas on the MTD web
>>> site. Try to specify less than that and see. You should leave enough
>>> PEBs reserved for bad eraseblocks handling - it is 1% by default.
I found the formulas and my specified size was 2 MiB too big.
Now it's fixed.
thanks for your help.

Best regards
alex
