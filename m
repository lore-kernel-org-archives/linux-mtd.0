Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15j10q-0007Er-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 17:12:49 +0100
Received: from mail8.cadvision.com ([207.228.64.93] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15j16k-0004Cu-00
	for linux-mtd@lists.infradead.org; Mon, 17 Sep 2001 17:18:54 +0100
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: Jose Rodríguez Argente <jradc@tid.es>, linux-mtd@lists.infradead.org
Subject: Re: Flash writings limit?
Date: Mon, 17 Sep 2001 10:00:34 -0600
Content-Type: text/plain
References: <3BA5F4EC.2060909@tid.es>
In-Reply-To: <3BA5F4EC.2060909@tid.es>
MIME-Version: 1.0
Message-Id: <01091710251200.00728@grosmorne.wirelessnetworksinc.com>
Content-Transfer-Encoding: 8bit
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

On Mon, 17 Sep 2001, Jose Rodríguez Argente wrote:
> Hello to every body,
> 
>     Is it harmful to the flash memory if the whole filesystem tree in 
> linux is intalled on flash (including /tmp /var and other directories 
> with a high rate of writing operations) ? I have Strata Flash with JFFS2 
> installed.
> 
>    Thank you in advance
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Howdy,

Well, it would be horribly slow when system logs etc in /var are written to
flash, but in practice you can write to Flash an incredible number of times
before it will become unreliable.  In my experience the first thing
that happens with age is that the erase cycles become slower and may increase
from around 500ms to as much as 15s, but the device will still work reliably. 
This aging happens quite quickly actually - a few hundred erase cycles and the
device will be significantly slower than when new.  (I have seen and fixed many
erase algorithms that do not allow sufficient erase time for old parts!).

When the manufacturer guarantees a 100 000 cycle limit, you can probably
expect an average lifetime of 1 000 000, so in a consumer device
with a life expectancy of around 3 years, you probably need not worry about the
Flash lifetime, even if all the Linux logs and crud are written to Flash, since
the keyboard or connectors will wear out before the flash does.  In the case of
a plug-in flash card for instance, the card will probably suffer mechanical
failure long before the electrical parts fail, either because of the connector
wearing out, or somebody stomping on the card... 

It would be a different matter for medical/military applications though, where one cannot
rely on average performance but needs to look at the worst case scenario.  So,
if you are working on a control system for an ICBM or something, then please
look at the 100 000 limit...

-- 
Herman Oosthuysen
E-mail: Herman@WirelessNetworksInc.com
Phone: 403+569-5687, Fax: 403+235-3965
