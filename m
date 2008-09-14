Received: from mta-a2.tc.umn.edu ([134.84.119.206])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KexVy-0000oV-MZ
	for linux-mtd@lists.infradead.org; Sun, 14 Sep 2008 19:44:11 +0000
Date: Sun, 14 Sep 2008 12:43:37 -0700
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
From: Grant Erickson <erick205@umn.edu>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <C4F2B779.11AAC%erick205@umn.edu>
In-Reply-To: <lyzlmh8cn1.fsf@ensc-virt.intern.sigma-chemnitz.de>
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

On 9/9/08 10:14 AM, Enrico Scholz wrote:
> Grant Erickson <gerickson@nuovations.com> writes:
> >>> +static const char *mtd_device, *img;
>>> 
>>> would it be possible to split this into two declarations?  I
>>> really don't know if 'img' points to a constant or non-constant
>>> char...
>> 
>> As currently implemented, both mtd_device and img point to
>> effectively read-only information. That is, there is no need to
>> modify or to attempt to modify what they point to.
> 
> Sorry, I might be unclear here. My comment was about readability
> not about correctness; e.g. without studying C standard, it is
> not obvious to me, whether
>
> [ Examples Omitted ]
>
> 
> When you think that answer to this question is trivial, then
> please explain 'char * const *a, *b;' ;)

Fair enough. Patch submitted.

>>>> -int main(int argc, char **argv)
>>>> +int main(int argc, char * const argv[])
>>> 
>>> Is this really correct?  C standard mentions only
>>> 
>>>                int main(void) { /* ... */ }
>>>                int main(int argc, char *argv[]) { /* ... */ }
>>> 
>>> as program entry points.  I suggest to cast 'argv' to a corresponding
>>> data type when it is used.
> 
>> adding the const qualifier simply conveys current program
>> intent. That is, the strings pointed to by argv are not
>> modified.
> 
> Then, you can write
> 
> | int main(int argc, char const * const argv[])

That's certainly possible as well; however, that was not the intent and, as
you cite with getopt below, would not accurately reflect how the program
respect argv.

> fwiw, the const'ness if argv[] content is violated when calling
> GNU getopt(3) as it reorders arguments.  E.g.
> 
> | argv[] = { "foo", "-a", "bar", "-c", NULL }
> 
> is changed by this function to
> 
> | argv[] = { "foo", "-a", "-c", "bar", NULL }

Understood on the operation of getopt. The declared intent was not that
order of the cells is constant but that the contents of the cells (i.e. the
strings) are.

Regards,

Grant
