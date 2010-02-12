Message-ID: <4B755B72.9060805@aimvalley.nl>
Date: Fri, 12 Feb 2010 14:45:22 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCHv2] MTD: Add UBI reboot notifier
References: <1244550775.5847.385.camel@localhost.localdomain>	<f5be75d5abc1acd236bedf36c55a860e@localhost>
	<1265980392.29027.12.camel@localhost>
In-Reply-To: <1265980392.29027.12.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> FYI, I do not like this patch, because it is not solving the problem, it
> just makes the problem less likely. I.e., you are still screwed if you
> reboot while some other task is doing erasure. Indeed, the background
> thread is not the only task which may do erases.
> 
> I'm not going to revert this patch, but wanted to let you know that I
> think it was my mistake to push it.
> 

so, how to solve this properly ?

probably the only way is the reboot notifier of the MTD chip driver
(for NOR flash only cmdset_0001 has one).
