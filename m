From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 17 Mar 2003 08:46:41 +0100
Subject: How use FTP on serial port(COM1)?
In-Reply-To: <OE32DCOTSt39LktrLEz00001e01@hotmail.com>
References: <OE32DCOTSt39LktrLEz00001e01@hotmail.com>
Message-ID: <20030317074641.GA9492@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 17 March 2003 10:50:09 +0800, guo_zhenglin wrote:
> 
> 1)my target board has not ethernet card, only has a 
> serial port (COM1) .

Do you mean _one_ serial port? In that case, you can have either
serial console or network over it, not both.

> 2)in order to update or maintenance targetboard's linux system 
> and application system,I want to use FTP or TFTP via COM1.
> 
> 3)I had config linux kernel :
>     CONFIG_PPP=y
>     CONFIG_PPP_ASYNC=y
>     CONFIG_PPPOE=y

PPPOE is unnecessary. Maybe some more options are needed, will check
that at work...

J?rn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
