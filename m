Message-ID: <54F49553.2020307@free-electrons.com>
Date: Mon, 02 Mar 2015 17:52:35 +0100
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424255528-1717-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150228090122.GA11148@brian-ubuntu>
In-Reply-To: <20150228090122.GA11148@brian-ubuntu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/02/2015 10:01, Brian Norris wrote:
> On Wed, Feb 18, 2015 at 11:32:07AM +0100, Maxime Ripard wrote:
>> The NDDB register holds the data that are needed by the read and write
>> commands.
>>
>> However, during a read PIO access, the datasheet specifies that after each 32
>> bytes read in that register, when BCH is enabled, we have to make sure that the
>> RDDREQ bit is set in the NDSR register.
>>
>> This fixes an issue that was seen on the Armada 385, and presumably other mvebu
>> SoCs, when a read on a newly erased page would end up in the driver reporting a
>> timeout from the NAND.
>>
>> Cc: <stable@vger.kernel.org> # v3.14
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> Pushed this one to linux-mtd.git. I'll try to get it out in the 4.0
> cycle. I assume patch 2 (the DT addition) will go through arm-soc.

Yes, now that you took the driver part,  I will apply it on mvebu and then push it
to arm-soc.

Thanks,

Gregory


> 
> Brian
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
