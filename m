Received: from f142.law11.hotmail.com ([64.4.17.142] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18CMZo-0007lE-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2002 16:10:45 +0000
From: "J B" <mad_flasher@hotmail.com>
To: Wolfram.Gettert@fci.com, linux-mtd@lists.infradead.org
Subject: Re: Support for command set 0003 not present
Date: Thu, 14 Nov 2002 10:40:37 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F142vcySa4k3z6QEy0D00009b5a@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
>
>Support for command set 0003 not present
>gen_probe: No supported vendor command set found

Is CONFIG_MTD_INTELEXT defined?  That could be the problem...

>The macro P_ID_INTEL_STD is defined. Do I have overseen to load a module or 
>is this command set not yet implemented. Is somebody working
>on this or do I have to it on my own?

A chip with command set 0x0003 should work.  That command set looks
like it is supported by cfi_cmdset_0001.c

Josh

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail
