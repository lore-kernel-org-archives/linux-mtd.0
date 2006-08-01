Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7i0u-0000BJ-5g
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 20:21:42 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1089799ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 17:21:33 -0700 (PDT)
Message-ID: <625fc13d0607311721l7fd6a0bcmfa00667edbe6885a@mail.gmail.com>
Date: Mon, 31 Jul 2006 19:21:33 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Brijesh Singh" <brijesh.ksingh@gmail.com>
Subject: Re: mtdparts kernel cmdline
In-Reply-To: <1b712b840607311534n2e67b5fcqde683b3469ccd65f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1b712b840607311534n2e67b5fcqde683b3469ccd65f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/31/06, Brijesh Singh <brijesh.ksingh@gmail.com> wrote:

> Can you give me a pointer on  why the "regions/offset/numblocks"
> fields are blank when I use kernel cmdline parameter.

You're using physmap to map the overall chip.  The default behavior of
that mapping driver is to create partitions if they exist then return,
which it does in your first case.  If no partitions are found, it will
create a single MTD for the entire chip.  That is what you are seeing
in the case where you do not specify any partitions on the command
line.

josh
