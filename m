Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3uiF-0004fa-Ma
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 10:25:19 +0000
Message-ID: <4059790D.4020904@arcom.com>
Date: Thu, 18 Mar 2004 10:25:17 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <200403172051.22120.dk.dbox2@gmx.net>
In-Reply-To: <200403172051.22120.dk.dbox2@gmx.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Erasebug on AMD flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dkey wrote:
> 
> we are using jffs2 on the dbox2 and AMD flash chips, but since rev. 1.96 of 
> cfi_cmdset_0002.c we can't erase the flashes. rev. 1.94 works without 
> problems.

"since 1.96" doesn't make sense.  Any breakage would be from 1.95.

> here are some debug infos, tell me if you need more!

Part numbers of the flash chips and their configuration (interleaved etc.).

> would be please if anybody can take a look over the code or revert revision of 
> cfi_cmdset_0002.c to 1.94.

There's no reason why you can't revert to 1.94 yourself.

FWIW, I'm now of the opinion that chip_status() is definately broken for 
interleaved chips and probably cannot be made to work without ending up 
with a mess.

I would suggest using the data polling algorithm instead (where applicable).

Also, ignoring the internal flash timeout (DQ5 toggling) and instead 
relying on the software timeout might be acceptable.  However, a 
repeatedly suspended erase keeps getting its software timeout extended 
and thus there is a possibility of the software timeout never occuring. 
  Hmmm.  An internal timeout requires a chip reset and thus we can't 
actually suspend an internally timed-out erase so the software timeout 
won't be extended.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
