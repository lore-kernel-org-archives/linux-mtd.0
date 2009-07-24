Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUDtB-0000v4-Go
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 06:04:21 +0000
Message-ID: <4A694EB0.9040105@gmail.com>
Date: Fri, 24 Jul 2009 09:03:28 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: UBIFS robustness questions
References: <200907241600.54640.manningc2@actrix.gen.nz>
In-Reply-To: <200907241600.54640.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2009 07:00 AM, Charles Manning wrote:
> This is probably documented somewhere but I could not find it...
>
> What operations in UBIFS are robust to power failure and which are not?

Hi, did you look through these:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file

>
> I know for example that writing a file into flash does not mean it has been
> completely written to flash until after a sync, but what about other
> operations such as mv?
>
> The reasonn I'm asking this is that I want to be able to "hot-swap" a
> directory of files without losing any file state.

Err, if you do sync() and the like properly, you should not loose anything.

> What I'm considerings doing is something like:
>
> Start with ~/runtime having a sane set of files
>
> untar etc into ~/updated
> sync
> mv ~/updated ~/run-time
> sync
>
> What is unacceptable is that, at any time, a power failure/reboot results in
> ~/runtime having a non-sane set of files.

Err, this will just move "updated" to the "runtime" directory. Is this what
you mean? But the above must be safe.

> * Does the above sequence look safe?
> * Is the second sync required?

It is required if you want to make sure that the directory has really been renamed,
otherwise the renaming data will sit in the write-buffer for some time, and in case
of a power you end up with "updated" at the old place, but nothing should be
corrupted. IOW, you do not have to, but may want to.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
