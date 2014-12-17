Date: Wed, 17 Dec 2014 10:04:24 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Message-ID: <488523809.20376.1418832264672.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <alpine.DEB.2.02.1412171034350.8366@lnxricardw1.se.axis.com>
References: <1683475520.65208.1411665491176.JavaMail.zimbra@xes-inc.com>
 <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
 <20141217023344.GS9759@ld-irv-0074>
 <alpine.DEB.2.02.1412171034350.8366@lnxricardw1.se.axis.com>
Subject: Re: [PATCH 2/2] mtd: map_rom: Support UBI on ROM
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
> From: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
> Sent: Wednesday, December 17, 2014 3:37:42 AM
> 
> On Wed, 17 Dec 2014, Brian Norris wrote:
> 
> > But then I'm curious: how do you get anything useful out of using UBI on
> > a read-only device? You don't need to (and can't) handle anything like
> > read disturb, and there's no write wear that needs to be leveled.
> 
> Don't know about this particular case, but in some cases it can be an
> advantage to be able to use the same file system image in both a read-only
> and a writable environment.
>
> Say you have some form of ROM device with no bit flips, but occasionally
> (e.g. during development) you want to use the same file system image in a
> flash. While the same thing can be accomplished by using seperate file
> systems which share the same content, it can simplify the whole system if
> only one file system image is needed which can reside in multiple types of
> media.

Thanks Ricard, you have touched on the scenario that I am concerned
about. The environment in our case is a single-board computer that can
become read-only based on a hardware jumper or signal from a backplane.
It would be tedious to _have_ to prepare a separate image in order to
install the SBC into a backplane that forces the NOR into read-only
operation. Instead, we find it advantageous to be able to simply freeze
the state of the UBI filesytem until the SBC is moved back to a
read-write environment for further development.

-Aaron
