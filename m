Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hVnT-0001XO-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 13:08:31 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: CFI Devices in x8 mode 
Date: Mon, 26 Mar 2001 13:07:31 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEGEFHCIAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <32701.985608024@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>The 8-bit buswidth probe doesn't attempt to probe for a device type X16 any
>more. It should. Someone gave me a patch for that a few days ago, I think -
>but I can't find it. I've just committed what I think is the correct fix to
>CVS.

Sorry - I think I'm misunderstanding - I've got an eight bit device here but
the code
looks as though its accessing it as a 16-bit device from what I can see in
the spec.

For word addressing the query data structure starts at 0x10 and continues
'Q', 'R', Y', P_IDlo, P_IDhi etc.
For byte addressing the q.d.s. starts at 0x20 and continues 'Q', 'Q', 'R',
'R', 'Y', 'Y', P_IDlo, P_IDhi etc.

If I'm reading this stuff right then the cfi_cfi_probe() code doesn't seems
to be taking the base offset into account ?

Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
