Message-ID: <540A6F09.9000605@killerwolves.net>
Date: Sat, 06 Sep 2014 12:18:49 +1000
From: Ben Peddell <klightspeed@killerwolves.net>
MIME-Version: 1.0
To: Arnaud Ebalard <arno@natisbad.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] ARM: MVEBU: Netgear RN102: Use Hardware BCH ECC
References: <1409898233-9273-1-git-send-email-klightspeed@killerwolves.net>	<20140905154140.GA1377@arch.hh.imgtec.org>
 <87ha0l23nt.fsf@natisbad.org>
In-Reply-To: <87ha0l23nt.fsf@natisbad.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06 Sep 2014 at 06:49, Arnaud Ebalard wrote:
> FWIW, you can add my:
> 
>  Tested-by: Arnaud Ebalard <arno@natisbad.org>
>  
> Additionally, Ezequiel, would anything prevent pushing the patch to
> stable team (nand entry in .dts was added in 3.14):
> 
>  Fixes: 92beaccd8b49 ("ARM: mvebu: Enable NAND controller in ReadyNAS 102 .dts file")

Depends-on: 5b3e507820c6 ("mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding")

The devicetree binding is not currently in linux-stable/linux-3.14.y
