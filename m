Received: from nf-out-0910.google.com ([64.233.182.188])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQv5n-0007hH-27
	for linux-mtd@lists.infradead.org; Sat, 23 Sep 2006 01:10:03 +0100
Received: by nf-out-0910.google.com with SMTP id o60so1197021nfa
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Sep 2006 17:08:59 -0700 (PDT)
Message-ID: <625fc13d0609221708g43c56ad8mfce6bd1fbae1e482@mail.gmail.com>
Date: Fri, 22 Sep 2006 19:08:59 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Nikhil Bansal (nikbansa)" <nikbansa@cisco.com>
Subject: Re: MTD Partitions
In-Reply-To: <ED07EE9DB42A8945877C9794BA15040805D582@xmb-sjc-229.amer.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ED07EE9DB42A8945877C9794BA15040805D582@xmb-sjc-229.amer.cisco.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/22/06, Nikhil Bansal (nikbansa) <nikbansa@cisco.com> wrote:
> Hi,
>
> >From what I understand you need to provide the partitioning details of
> MTD devices at the compile time. I was wondering if there is any way to
> partition a flash device at runtime based on the sectors. For Example:
> partition 1 from sector 1 to sector 10, partition 2 from sector 11 to
> sector 20.
>
> The thing is that we have a board with a flash chip on it and
> configuration of this chip may vary based on several factors. I don't
> have the luxury of compiling the kernel for each such requirement :( I
> think I read somewhere that at this point, partitioning can be done at
> compile time only but just wanted to confirm.
>
> By the way, we can keep the number of partitions fixed but size needs to
> be varied. Please let me know if it can be done.

You might want to take a look at UBI.  It can do much of what you are
looking for, depending on how complex things are.  It's still a work
in progress, but it's usable.

http://linux-mtd.infradead.org/doc/ubi.html

josh
