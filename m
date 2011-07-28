Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QmWoi-00082t-Ql
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 20:04:25 +0000
Message-ID: <4E31C11A.8050105@free-electrons.com>
Date: Thu, 28 Jul 2011 22:05:46 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: Flash filesystems benchmarks
References: <4E3131AE.7010408@free-electrons.com>
	<CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
In-Reply-To: <CAAfyv35zgDLpf6Hs0G0wESh0-BjoiWMH+4wA7+anSwR0rREtbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	tim.bird@am.sony.com, Linux Embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hi,

On 28/07/2011 21:14, Belisko Marek wrote:
> Hi,
> Great job ;). Maybe small README how to use scripts. I try to run
> ./performance-test.py but got en error because test.cfg doesn't exist.
 > Shouldn't there be input argument for specific board something like:
 > [...]

Thanks for the feedback. You're right, READMEs are missing ; they'll come.

The current procedure, regarding the configuration file, is:
  * write a configuration file (like those already provided as examples)
  * cp it to test.cfg
  * launch performance-test.py
why the cp ? because it allows to tweak it without changing the original.
But it would certainly be best to use a proper argument parsing 
(argparse, like for gnuplotize_*.py and generate_graphs.py) and have an 
optional configuration file.


The material and documentation to reproduce the tests isn't fully 
available yet but will be very soon.  I can already give you a link to 
the debian root filesystem (to be exported through NFS) that was used ; 
however I can't guarantee yet that it will work. 
http://free-electrons.com/~david/pub/RFS-benchmarks.tar.lzma (1.1GB)


David.

--
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
