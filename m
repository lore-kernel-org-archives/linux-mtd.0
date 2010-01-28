Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaXzC-0000z0-ON
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 17:16:59 +0000
Subject: Re: UBIFS log replay error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Niebuhr <BNiebuhr@efjohnson.com>
In-Reply-To: <A117B9F753B6EB4580D381ED91D0FED00174D955@transmail01.transcrypt.local>
References: <A117B9F753B6EB4580D381ED91D0FED00174D955@transmail01.transcrypt.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Jan 2010 19:15:16 +0200
Message-ID: <1264698916.1973.157.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-27 at 17:04 -0600, Brian Niebuhr wrote:
> All - 
> 
> I am bringing up a custom board with an UBIFS root file system.  The
> board appears to boot fine and I am able to access files in the file
> system.  I have been debugging other issues and in the process I have
> been powering off the board abruptly (i.e. turning off the power
> supply), and hence the filesystem doesn't get unmounted correctly.  The
> filesystem recovers most of the time, but on multiple occasions I've got
> the following error:
> 
> UBIFS: recovery needed
> UBIFS error (pid 1): validate_ref: bud at LEB 31:93848 was already
> referred
> UBIFS error (pid 1): replay_log_leb: log error detected while replaying
> the log at LEB 5:32
> 
> Obviously the filesystem wouldn't mount and my only option was
> re-flashing the filesystem.
> 
> Can anyone tell me what might be happening, and how I can correct it?
> The filesystem is being stored in Numonyx P30 NOR flash.  The dmesg
> output is as follows:

Which kernel version? How old UBIFS code base is? Please, follow this
guide:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
