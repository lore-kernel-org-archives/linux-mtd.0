Date: Fri, 12 Feb 2010 15:20:32 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: [PATCHv2] MTD: Add UBI reboot notifier
In-Reply-To: <4B755B72.9060805@aimvalley.nl>
Message-ID: <alpine.LFD.2.00.1002121517440.23383@dwoodhou-mobl2.ger.corp.intel.com>
References: <1244550775.5847.385.camel@localhost.localdomain>
	<f5be75d5abc1acd236bedf36c55a860e@localhost>
	<1265980392.29027.12.camel@localhost>
	<4B755B72.9060805@aimvalley.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Feb 2010, Norbert van Bolhuis wrote:

> so, how to solve this properly ?

In hardware.

Anything we do in software will be unreliable, and by masking the problem 
we do a disservice to anyone who actually tests their prototype hardware, 
because we might hide the problem from them until it's too late for 
them to fix it.

-- 
dwmw2
