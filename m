Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYMJU-0007NQ-8V
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 18:33:52 +0000
Message-ID: <4EDFB185.8030802@newsguy.com>
Date: Wed, 07 Dec 2011 10:33:41 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Peter Horton <phorton@bitbox.co.uk>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com> <4EDB89E9.6070306@newsguy.com>
 <1323065234.2316.2.camel@koala> <4EDCF840.7050107@newsguy.com>
 <4EDCFAAC.90709@bitbox.co.uk> <4EDD142B.6090303@newsguy.com>
 <87hb1de5b6.fsf@free.fr> <4EDF350D.9030104@bitbox.co.uk>
In-Reply-To: <4EDF350D.9030104@bitbox.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/2011 01:42 AM, Peter Horton wrote:
>
> It's not policy, it's a property of the NAND device.
>


I respectfully disagree.  Device property is how error prone it is and its error
correction capability.  Policy is how cautious you want to be with regard to
data integrity vis-a-vis erase block management.  But it *is* a fine line, and
one affects the other.  Plus Ricard makes a good point about devices with other
properties besides ecc strength that could potentially influence the policy
decision.

Thanks,
Mike
