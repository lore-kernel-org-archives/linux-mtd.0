From: David Woodhouse <dwmw2@infradead.org>
To: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
In-Reply-To: <77FE4A1FA59FF947845A42194AD6676277312A@uswaumsx07medge.med.ge.com>
References: 
	 <77FE4A1FA59FF947845A42194AD6676277312A@uswaumsx07medge.med.ge.com>
Content-Type: text/plain
Message-Id: <1078243054.17069.166.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 02 Mar 2004 15:57:34 +0000
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Interleave question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-02 at 09:50 -0600, Eisenhut, Daniel (MED) wrote:
> How would I find out what the interleave is for my Intel J3 flash chip?
> I've been unable to find anything online or in the datasheet.
> And what exactly is the interleave?

This is not a function of the chip itself but of the way it is connected
to the bus.

By 'interleave' in this context, we mean the number of flash chips which
are attached in parallel to the data bus. 

So if you have a bus which is 32 bits wide, you can either have two
16-bit chips (interleave=2) or four 8-bit chips (interleave=1). 

Actually you could also have four chips in 8-bit mode which are
_actually_ 16-bit chips, which makes a difference in choosing precisely
which addresses to send certain magic commands. But you can ignore that
for the purpose of this question.

In short, refer to your board documentation. 

-- 
dwmw2
