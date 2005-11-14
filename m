Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbiSF-00034w-WF
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 12:49:23 -0500
Message-ID: <4378CE1D.4030605@arcom.com>
Date: Mon, 14 Nov 2005 17:49:17 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: jbowler@acm.org
References: <006c01c5e939$ba996570$1001a8c0@kalmiopsis>
In-Reply-To: <006c01c5e939$ba996570$1001a8c0@kalmiopsis>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	'Alessandro Zummo' <azummo-lists@towertech.it>
Subject: Re: ixp4xx stuff
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

John Bowler wrote:
> From: David Vrabel
> 
>>>along with the other NSLU2 patches.  We found that it is now necessary to
>>>set CONFIG_MTD_LE_BYTE_SWAP - with the NSLU2 patches CONFIG_MTD_BE_BYTE_SWAP
>>>must be set.  If this is not done (i.e. if BE is set) the flash probe fails.
>>
>>Neither of these options should be enabled.  The flash data is returned
>>in the same order regardless of the endianness of the CPU.
> 
> 
> What is the difference between CONFIG_MTD_BE_BYTE_SWAP and ..._NO_SWAP on a
> BE machine?

They're both no-ops on BE CPUs.

To conclude: With CONFIG_MTD_NOSWAP set the current patches:

a) Work on BE systems as they have always done (tested by myself and
it's fairly obvious it's right since it doesn't do anything different).
b) Work on LE systems (as you have verified -- CONFIG_MTD_LE_BYTE_SWAP
is a no-op on LE CPUs).

So it looks like everything is good to go, yes?

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
