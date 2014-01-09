Received: from mail-lb0-f179.google.com ([209.85.217.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1NR5-0001if-LE
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 21:46:44 +0000
Received: by mail-lb0-f179.google.com with SMTP id w7so2722728lbi.24
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2014 13:46:12 -0800 (PST)
MIME-Version: 1.0
Sender: chris@chrisdavid.com
Date: Thu, 9 Jan 2014 13:40:22 -0800
Message-ID: <CAFVsH1KmNrvect1B8BdR6vYRU8_pXwYha7cdNBkmGyZ4JHp40g@mail.gmail.com>
Subject: 6 second sleep required for file sync?
From: Chris David <cd@chrisdavid.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am noticing some odd behavior that seems inconsistent with at least
some of the UBIFS documentation.

When unpacking an UBI image, it seems that an operation like "sync ;
sleep 6 ; sync" is required in order to synchronize all the files to
flash.  After simply changing the 6 to a 5, and then after cutting
power after the second sleep, truncated files are observed, including
both 0 length files, and some that are just missing contents toward
the end.

It seems this could be an artifact of the UBI write back buffer.  The
timing seems sensitive around 5 seconds, and this happens to be the
maximum time on the UBI write back buffer flush.

None the less, it is surprising more than a single sync is required to
flush all the files, based on my interpretation of the documentation
and FAQ.

Is this a known or expected behavior?  Or could it possibly be a bug?

And what I really want to know is, could the 6 second sleep and
additional sleep be required during the data synchronization step when
doing a POSIX atomic file operation?  Or is this odd behavior specific
to unpacking a UBIFS image?  I can say I have only observed this
behavior while unpacking a UBIFS image so far.

I'm not subscribed to the email list, please reply to me directly.

Thanks,

Chris David
