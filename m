Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kd66y-0007P6-Nv
	for linux-mtd@lists.infradead.org; Tue, 09 Sep 2008 16:30:45 +0000
Date: Tue, 09 Sep 2008 09:30:17 -0700
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
From: Grant Erickson <gerickson@nuovations.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <C4EBF2A9.11917%gerickson@nuovations.com>
In-Reply-To: <lybpyxa1x8.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/9/08 6:23 AM, Enrico Scholz wrote:
> Grant Erickson <gerickson@nuovations.com> writes:
>> +static const char *mtd_device, *img;
> 
> would it be possible to split this into two declarations?  I
> really don't know if 'img' points to a constant or non-constant
> char...

As currently implemented, both mtd_device and img point to effectively
read-only information. That is, there is no need to modify or to attempt to
modify what they point to.

Should that change in the future, these can be declared differently;
however, for the present, the const qualifier accurately represents program
intent.

>> -int main(int argc, char **argv)
>> +int main(int argc, char * const argv[])
> 
> Is this really correct?  C standard mentions only
> 
>                int main(void) { /* ... */ }
>                int main(int argc, char *argv[]) { /* ... */ }
> 
> as program entry points.  I suggest to cast 'argv' to a corresponding
> data type when it is used.

Those are certainly the two most common prototypes for main. However,
because main has no prototype, adding the const qualifier simply conveys
current program intent. That is, the strings pointed to by argv are not
modified.

Regards,

Grant
