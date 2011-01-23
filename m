Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ph2LM-0000OH-6p
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2011 15:59:08 +0000
Received: by wyf22 with SMTP id 22so3307913wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Jan 2011 07:59:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTin1xCqRhbisnK00-i_sZNKctB6GDtsQPjZh4YQu@mail.gmail.com>
References: <AANLkTin1xCqRhbisnK00-i_sZNKctB6GDtsQPjZh4YQu@mail.gmail.com>
Date: Sun, 23 Jan 2011 10:59:05 -0500
Message-ID: <AANLkTinZ_cTX7V1yFcejS3=+s7DVCYc8abeWQyXmGA+r@mail.gmail.com>
Subject: Re: NAND with UBI - MTBF calculation
From: Josh Boyer <jwboyer@gmail.com>
To: Navaneethan P <pnavanee@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: navaneethan.p@aricent.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 21, 2011 at 8:28 AM, Navaneethan P <pnavanee@gmail.com> wrote:
> Hi linux-mtd users,
>
> We are using the Samsung's NAND (128MB) in our system. We are running
> ubi over the NAND device.
> It is divided into 9 ubi volumes.
> Now, we would like to calculate the MTBF of the system (especially
> NAND with UBI).
> I request you to give the inputs in this regard.

This isn't enough information to even start.  MTBF will depend on the
exact part number, the frequency and size of writes (translated to
erases), the filesystems in use on top of the volumes, etc.  Even the
frequency of reads can matter, due to the read disturb issue found in
NAND.

josh
