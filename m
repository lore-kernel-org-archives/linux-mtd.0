Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYDEh-0007Wu-Op
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 09:56:52 +0000
Message-ID: <50A21959.5050505@parrot.com>
Date: Tue, 13 Nov 2012 10:56:41 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] mtdoops : don't erase flash at each boot
References: <1350660573-6631-1-git-send-email-matthieu.castet@parrot.com>
 <1352735412.2262.15.camel@sauron.fi.intel.com>
In-Reply-To: <1352735412.2262.15.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Fri, 2012-10-19 at 17:29 +0200, Matthieu CASTET wrote:
>> If there is no oops stored (flash is erased), find_next_position will
>> exit with maxcount == 0xffffffff and erase the first page.
>>
>> Only erase it if mark_is_used.
>>
>> Signed-off-by: Matthieu Castet <matthieu.castet@parrot@com>
> 
> The code of mtdoops is really hard to read. Could you please provide a
> better commit message with better description about what you do:
> 
> 1. what problem you fix exactly, and why is it a problem
> 2. how the code currently works
> 3. how you change it to make the problem go away
> 
> Thanks!
> 

Is the following changelog ok ?


The current version on mtdoops erase first block of mtdoops partition at each
boot if there is no oops stored in flash. This can wear the flash.

When mtdoops start, find_next_position is called to find the next free entry in
the circular buffer. But if the flash is erased, find_next_position don't find
anything (maxcount == 0xffffffff) and start with the first entry after erasing it.

The scanning that is done in find_next_position already track free/used entries.
So if at the end of the scanning we don't find anything, we can start at the
first entry and erased the entry only if it is marked as used.
Most of this is implemented in mtdoops_inc_counter, so to avoid duplicating
code, if we don't find anything we set position to -1. mtdoops_inc_counter with
increment it, erase the entry if needed and start as before with nextpage = 0
and nextcount = 1).

Also during the scan phase, we use the MTDOOPS_KERNMSG_MAGIC to detect corruped
entries.
