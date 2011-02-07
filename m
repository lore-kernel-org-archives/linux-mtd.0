Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmTOV-0001D6-4S
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:52:51 +0000
Message-ID: <4D50154D.6060700@keymile.com>
Date: Mon, 07 Feb 2011 16:52:45 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Michael Cashwell <mboards@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>	
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>	
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>			
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net> <OF2C1ABD39
	<4D5005E4.1040506@keymile.com>
	<OFFF2C6D34.91E5D6C3-ONC1257830.005200CA-C1257830.00528914@transmode.se>
	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
In-Reply-To: <96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Am 02/07/2011 04:46 PM, schrieb Michael Cashwell:
>>> ------------------------------
>>> +    /* numonyx data sheet clearly says to always reset the status bits
>>> +       before resuming a suspended erase. not doing so results in
>>> +       an ambiguous mixture of status bits once the command ends. */
>>> +    debug_map_write(map, CMD(0x50), adr);
>>> +    debug_map_write(map, CMD(0xd0), adr);
>> The 0xd0 seems should not be there, its already in place?

Sorry the 0x0d was already there.

>> I plan to submit this one shortly, if you and Michael could Ack. it when I do, that would be great.
> Happy to test and ack when it arrives.
>
> -Mike
>
Looking forward to do so.

Stefan
