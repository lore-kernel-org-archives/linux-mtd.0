Received: from bosmailout14.eigbox.net ([66.96.189.14])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QF8KP-0006ir-5z
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 17:15:05 +0000
Received: from bosmailscan12.eigbox.net ([10.20.15.12])
	by bosmailout14.eigbox.net with esmtp (Exim) id 1QF8KN-0000w2-M7
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 13:15:03 -0400
Message-ID: <d7bb9e8d1c11cece8092e2f4c40436e2.squirrel@emailmg.startlogic.com>
In-Reply-To: <4DB7C9F9.9000609@free-electrons.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
	<896346e425b9fed6ed42ee9c4144e135.squirrel@emailmg.startlogic.com>
	<4DB7C9F9.9000609@free-electrons.com>
Date: Wed, 27 Apr 2011 13:14:36 -0400
Subject: Re: Discovering current MTD partition
From: umar@janteq.com
To: "David Wagner" <david.wagner@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: umar@janteq.com
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 04/27/2011 09:25 AM, umar@janteq.com wrote:
>> Hi,
>> [...]
>> What I'd like is to detect from userspace is which /dev/mtdX partition
>> is
>> the currently executing program running on because that is the partition
>> that has been obviously booted.
>
> I think you might want to take a look at getmntent (3) : it is a libc
> function for getting the /etc/mtab entries. It also seems to be portable.
>
> Cheers,
> David.
>
> --
> David Wagner, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

This will give me the same info as /proc/mtab.  I cannot figure out how I
can infer which /dev/mtdXX was booted from with this information.
