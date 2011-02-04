Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PlJT4-0000SS-NZ
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 11:04:47 +0000
Message-ID: <4D4BDD48.6040600@keymile.com>
Date: Fri, 04 Feb 2011 12:04:40 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>		
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>		
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>		
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>		
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
In-Reply-To: <OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Michael Cashwell <mboards@prograde.net>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jocke

The code does the same, but is much nicer :-)
My test is also working again.

Im on the way to find out why our old P30 (130nm) Flash worked
without the fix.

Regards Stefan


Am 02/04/2011 11:47 AM, schrieb Joakim Tjernlund:
> Stefan Bigler<stefan.bigler@keymile.com>  wrote on 2011/02/04 00:18:44:
>> Hi
>>
>> Now I have a patch that fix my problem. I did not yet do a lot of tests
>> and I did
>> not yet analyzed correctness in all cases.
>> I check in the inval_cache_and_wait_for_operation() of the status is
>> status_OK
>> the if the chip->state and the chip_state (the current chip state and
>> the chip state
>> when the function is called) are equal or not. If equal break and exit
>> (set the
>> chip->state= FL_STATUS) and if not equal add the thread in the wait queue.
>>
>> I think we are not finished when not equal so we have do not have to
>> take the mutex.
>>
>> Now why this code worked with the older Flash chips. I don't know, but
>> eventually
>> they are slower after the write buffer command 0xe8 and they are still
>> busy when
>> inval_cache_and_wait_for_operation() checks if status_OK.
>> Tomorrow I'll check if this is the case. Now I do not have access to the HW.
>>
>> Regards Stefan
> I havn't looked into this but I think I would rather see something like:
> -        if (map_word_andequal(map, status, status_OK, status_OK))
> +        if (map_word_andequal(map, status, status_OK, status_OK)&&
> +           (chip->state == chip_state))
>
> Does this work for you too?
>
>   Jocke
>
>
