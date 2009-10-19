Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mzpbq-0003va-OT
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 10:37:06 +0000
Message-ID: <4ADC4137.1060204@simtec.co.uk>
Date: Mon, 19 Oct 2009 11:36:39 +0100
From: Ben Dooks <ben@simtec.co.uk>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: NAND: Add flags to the probe calls to control scan behaviour
References: <20091013090019.091262272@fluff.org.uk>
	<1255534646.32489.169.camel@localhost>
In-Reply-To: <1255534646.32489.169.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Simtec Linux Team <linux@simtec.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2009-10-13 at 10:00 +0100, Ben Dooks wrote:
>> plain text document attachment (nand-update-probe2.patch)
>> Add a flags field to the two scan calls to control the behaviour of the
>> scan process. Currently the only flag we define is NAND_PROBE_SPECULATIVE
>> to stop the user-worrying messages 'No NAND device found!!!'. This message
>> often worries users (was three exclamation marks really necessary?) and is
>> even worse in systems such as the Simtec Osiris where there may be optional
>> NAND devices which are not known until probe time.
>>
>> The approach is to change nand_scan_ident and nand_scan to have a new flags
>> field, and add wrapper functions to the header files so that we do not have
>> to get around all the drivers doing a search and replace. If we where to
>> change all the call sites for nand_scan() and nand_scan_ident() we would
>> touch about 40 drivers.
>>
>> Signed-off-by: Ben Dooks <ben@simtec.co.uk>
>> Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>
> 
> So you are introducing this new flag just to make generic NAND layer be
> silent if it cannot identify device type, right?

I'd rather it be silent if it cannot find a device, as a number of our boards
have slots where NAND devices may be fitted by the customer and as such all
possibilities are registered with the NAND driver.

> Could you please elaborate why more why is this needed a bit more? What
> is the driver?

Because customers get scared when errors with '!!!' turn up.

> Why not to just remove that print at all?

Possible, but what about the case where there is a legitimate problem with
the device that is supposed to be there.

-- 
Ben Dooks, Software Engineer, Simtec Electronics

http://www.simtec.co.uk/
