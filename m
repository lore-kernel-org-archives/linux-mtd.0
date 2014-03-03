Received: from mail-ie0-f178.google.com ([209.85.223.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKaH0-0005o6-6k
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 21:19:42 +0000
Received: by mail-ie0-f178.google.com with SMTP id lx4so2191696iec.37
 for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2014 13:19:20 -0800 (PST)
Received: from gmail.com (64-198-156-98.ip.mcleodusa.net. [64.198.156.98])
 by mx.google.com with ESMTPSA id ai4sm42826335igd.3.2014.03.03.13.12.07
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Mon, 03 Mar 2014 13:12:07 -0800 (PST)
Date: Mon, 3 Mar 2014 15:12:05 -0600
From: Andrew Ruder <andy@aeruder.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [HACK] fs/super.c: sync ro remount after blocking writers
Message-ID: <20140303211205.GA7311@gmail.com>
References: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
 <20140203102303.GB11829@infradead.org> <53105604.4050501@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53105604.4050501@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 28, 2014 at 10:25:24AM +0100, Richard Weinberger wrote:
> Is it possible to create such a test case?  I don't know whether it is
> possible to trigger the issue on a regular filesystem.  But as hch
> noted, it would be nice to have. :)

I've given this some thought after initially receiving the email and it
would not be easily recreated.  As best as I can tell, the test case
would be something along the line of:

1. # Start up a filesystem writer
2. mount -o remount,ro /testfilesystem
3. # Immediately mark block device as read only
4. # Reboot, show that the filesystem is dirty next time around.

Step 3 I'm not sure how to do, Step 4 makes for the world's most painful
test case.  The thread from Leon Pollak is probably the easiest way to
recreate these issues (remount,ro followed by a hardware-enabled
read-only) and I'm just not sure it belongs in a test case.

- Andy
