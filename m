Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDw32-0000E2-Is
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 08:19:28 +0000
Message-ID: <4B0F8B78.5080405@nokia.com>
Date: Fri, 27 Nov 2009 10:19:04 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Ronny Dierckx <ronny.dierckx@telenet.be>
Subject: Re: UBIFS synchronisation questions about file create/delete
References: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
In-Reply-To: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Ronny Dierckx wrote:
> Hi,
> 
> I'm using UBIFS (git://git.infradead.org/~dedekind/ubifs-v2.6.27.git)
> on an ARM device with OneNAND flash.
> 
> I've been reading the documentation, FAQ, ... about sync/fsync/fdatasync and
> the
> write-back buffers, but there are still some things I don't understand.
> 
> I create a file with vi, write some data in it, close it, don't call sync.
> Then 
> after waiting 10 minutes I cut the power. When the system is restarted, the
> file is
> not there anymore?! Is this normal behavior? Shouldn't there be at least
> a file of 0 bytes because "UBIFS operations which change directory entries
> are synchronous"?
> Doesn't this mean that creating or deleting a file entry doesn't require a
> sync ?

No it is not normal behaviour.

10 minutes is long enough for everything to be written and flushed.  The file
should be completely intact.

No UBIFS operations which change directory entries are not entirely
synchronous.  There is a NAND-page-sized buffer which must be flushed.
It is flushed every 5 seconds or so.  Otherwise you must do some kind of
sync.

I can only guess that that version of UBIFS is somehow broken.

Please send a bug report as described here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
but set the Default message level to 1.
