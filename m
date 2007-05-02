Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjEXH-00037i-Iv
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 09:06:25 -0400
Message-ID: <46388BF9.4060807@nokia.com>
Date: Wed, 02 May 2007 16:02:49 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 wrong data CRC message
References: <46385786.5020804@nokia.com>
	<1178108604.2875.182.camel@pmac.infradead.org>
In-Reply-To: <1178108604.2875.182.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext David Woodhouse wrote:
> On Wed, 2007-05-02 at 12:19 +0300, Adrian Hunter wrote:
>> Can someone explain why this message is not an error?
>>
>> JFFS2 notice: (17573) read_dnode: wrong data CRC in data node at
>> 0x07e85800: read 0x86c6656c, calculated 0xaf4f2bc5. 
> 
> Because it's almost certainly harmless. It usually just means that you
> rebooted or reset without cleanly unmounting -- and thus without the
> writebuffer getting flushed to finish the node it was writing at the
> time. So the data CRC fails, and the node is ignored.
> 
Unfortunately I started with an empty flash and have not rebooted at all.

I've been running stress tests constantly for about a week, and this is
the only JFFS2 message.  The tests do unmount and remount, but there are
no error messages.

So unless you can offer an alternative explanation I am going to have to
assume it is an error.
