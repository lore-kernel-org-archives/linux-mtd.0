Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKQGK-0008Dd-VD
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:24:45 +0000
Message-ID: <4DCB8B4C.3060009@free-electrons.com>
Date: Thu, 12 May 2011 09:25:00 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: inappropriate ioctl when attaching
References: <4DCAB697.90906@free-electrons.com>
	<Pine.LNX.4.64.1105120903090.15966@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1105120903090.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/12/2011 09:03 AM, Ricard Wanderlof wrote:
> 
> On Wed, 11 May 2011, David Wagner wrote:
>> # ubiattach -p /dev/mtd2
>> ubiattach: error!: cannot attach "/dev/mtd2"
>>           error 25 (Inappropriate ioctl for device)
>>
> What happens if you do ubiattach -m 2 instead, i.e. specifying the mtd
> number rather than the complete device path?

I also tried
ubiattach /dev/ubi_ctrl -m 2
but it didn't change anything

David.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
