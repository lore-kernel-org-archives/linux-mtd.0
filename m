Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHa9h-0002fZ-SR
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 08:40:50 +0000
Message-ID: <4959E12D.9060609@nokia.com>
Date: Tue, 30 Dec 2008 10:51:57 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Cal Page <pagcal@runbox.com>
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
References: <4958F2AF.8060606@runbox.com>
In-Reply-To: <4958F2AF.8060606@runbox.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ubifs <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cal Page wrote:
> How do I get past this UBIFS mount failure:
> 
> UBIFS error (pid XXX): insert_node: duplicate sqnum in replay.
> 
> UBIFS DBG (pid XXX): ubifs_bp_thread: background thread "ubifs_bht0_1" stops

The error is fatal.  There is no getting past it.

Perhaps you could send some more information.  What kernel version are you using?
What patches have you applied? How did the problem arise? Can you send all the
kernel messages? Can you send an image of the file system?
