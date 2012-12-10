Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti971-0004RO-KV
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 19:33:59 +0000
Message-ID: <50C6393E.9070207@newsguy.com>
Date: Mon, 10 Dec 2012 11:34:22 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable
 mode
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
 <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
 <87hanvplmy.fsf@free.fr> <87a9tnpl2j.fsf@free.fr>
In-Reply-To: <87a9tnpl2j.fsf@free.fr>
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

On 12/09/2012 02:38 AM, Robert Jarzmik wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> 
>> I was considering adding this to the docg3 driver, but I didn't because I was
>> afraid what would happen if you change this mode *after* mounting a partition.
>> Imagine you have your rootfs mounted on /dev/mtd2, and u-boot is in /dev/mtd1 :
>> wouldn't changing the reliable mode to write "mtd1" corrupt all writes to mtd2
>> ?
> 
> I will rephrase that : I didn't "succeed" in having that parameter mtd partition
> bound. If you find a way, I'll steal it for docg3 driver :)


Yeah, I seemed to recall that reliable mode is supported in the docg3 driver.


> 
> If you don't, your patch is fine :
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 

Thanks Robert.

Mike
