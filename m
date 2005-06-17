Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DjFUV-00034m-Nc
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2005 07:58:33 -0400
Message-ID: <42B2BAE3.7040709@anagramm.de>
Date: Fri, 17 Jun 2005 13:58:27 +0200
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050616T213451-152@post.gmane.org>
In-Reply-To: <loom.20050616T213451-152@post.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: I2C FRAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Sergei,

For I2C related stuff please have a look at the lm_sensors project at
http://secure.netroedge.com/~lm78/

There are generic drivers for the widely used I2C eeproms which you
can use/modify/... for several platforms.
Please check the documentation there.

Greets,

Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19


Sergei Sharonov wrote:
> Hi,
> 
> sory if this is FAQ, but I got a 64 kBit FRAM on I2C bus (FM24CL64) and I was
> wandering what is the best way to make it usable? Is there an mtd driver to turn
> it into a char and/or block device?
> 
> Sergei Sharonov
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
