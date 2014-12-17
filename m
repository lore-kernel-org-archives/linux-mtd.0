Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1B3c-0007g4-UP
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 09:38:13 +0000
Date: Wed, 17 Dec 2014 10:37:42 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: map_rom: Support UBI on ROM
In-Reply-To: <20141217023344.GS9759@ld-irv-0074>
Message-ID: <alpine.DEB.2.02.1412171034350.8366@lnxricardw1.se.axis.com>
References: <1683475520.65208.1411665491176.JavaMail.zimbra@xes-inc.com>
 <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
 <20141217023344.GS9759@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Aaron Sierra <asierra@xes-inc.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 17 Dec 2014, Brian Norris wrote:

> But then I'm curious: how do you get anything useful out of using UBI on
> a read-only device? You don't need to (and can't) handle anything like
> read disturb, and there's no write wear that needs to be leveled.

Don't know about this particular case, but in some cases it can be an 
advantage to be able to use the same file system image in both a read-only 
and a writable environment.

Say you have some form of ROM device with no bit flips, but occasionally 
(e.g. during development) you want to use the same file system image in a 
flash. While the same thing can be accomplished by using seperate file 
systems which share the same content, it can simplify the whole system if 
only one file system image is needed which can reside in multiple types of 
media.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
